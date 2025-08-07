
import UIKit

@MainActor
class StoreItemContainerViewController: UIViewController, UISearchResultsUpdating {
    
    @IBOutlet var tableContainerView: UIView!
    @IBOutlet var collectionContainerView: UIView!
    
    let searchController = UISearchController()
    let storeItemController = StoreItemController()
    
    var tableViewDataSource: UITableViewDiffableDataSource<String, StoreItem.ID>!
    var collectionViewDataSource: UICollectionViewDiffableDataSource<String, StoreItem.ID>!

    var items = [StoreItem]()
    
    var itemIdentifiersSnapshot: NSDiffableDataSourceSnapshot<String, StoreItem.ID> {
        var snapshot = NSDiffableDataSourceSnapshot<String, StoreItem.ID>()
        
        snapshot.appendSections(["Results"])
        snapshot.appendItems(items.map { $0.id })
        
        return snapshot
    }

    let queryOptions = ["movie", "music", "software", "ebook"]
    
    // keep track of async tasks so they can be cancelled if appropriate.
    var searchTask: Task<Void, Never>? = nil
    var tableViewImageLoadTasks: [IndexPath: Task<Void, Never>] = [:]
    var collectionViewImageLoadTasks: [IndexPath: Task<Void, Never>] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.automaticallyShowsSearchResultsController = true
        searchController.searchBar.showsScopeBar = true
        searchController.searchBar.scopeButtonTitles = ["Movies", "Music", "Apps", "Books"]
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(fetchMatchingItems), object: nil)
        perform(#selector(fetchMatchingItems), with: nil, afterDelay: 0.3)
    }
                
    @IBAction func switchContainerView(_ sender: UISegmentedControl) {
        tableContainerView.isHidden.toggle()
        collectionContainerView.isHidden.toggle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tableViewController = segue.destination as? StoreItemListTableViewController {
            configureTableViewDataSource(tableViewController.tableView)
        }
        
        if let collectionViewController = segue.destination as? StoreItemCollectionViewController {
            configureCollectionViewDataSource(collectionViewController.collectionView)
        }
    }

    func configureTableViewDataSource(_ tableView: UITableView) {
        tableViewDataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { [weak self] tableView, indexPath, itemIdentifier in
            guard let self,
                  let item = items.first(where: { $0.id == itemIdentifier }) else {
                return nil
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath) as! ItemTableViewCell
            
            cell.configure(for: item, storeItemController: storeItemController)
            
            if cell.itemImageView.image == ItemTableViewCell.placeholder {
                tableViewImageLoadTasks[indexPath]?.cancel()
                tableViewImageLoadTasks[indexPath] = Task { [weak self] in
                    guard let self else { return }
                    defer {
                        tableViewImageLoadTasks[indexPath] = nil
                    }
                    do {
                        _ = try await storeItemController.fetchImage(from: item.artworkURL)
                        
                        var snapshot = tableViewDataSource.snapshot()
                        snapshot.reconfigureItems([itemIdentifier])
                        await tableViewDataSource.apply(snapshot, animatingDifferences: true)
                    } catch {
                        print("Error fetching image: \(error)")
                    }
                }
            }
            return cell
        })
    }
    
    func configureCollectionViewDataSource(_ collectionView: UICollectionView) {
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: Bundle(for: ItemCollectionViewCell.self))
        let cellRegistration = UICollectionView.CellRegistration<ItemCollectionViewCell, StoreItem.ID>(cellNib: nib) { [weak self] cell, indexPath, itemIdentifier in
            guard let self = self,
                  let item = self.items.first(where: { $0.id == itemIdentifier}) else {
                return
            }

            cell.configure(for: item, storeItemController: storeItemController)
            
            if cell.itemImageView.image == ItemCollectionViewCell.placeholder {
                collectionViewImageLoadTasks[indexPath]?.cancel()
                collectionViewImageLoadTasks[indexPath] = Task { [weak self] in
                    guard let self else { return }
                    defer {
                        collectionViewImageLoadTasks[indexPath] = nil
                    }
                    do {
                        _ = try await storeItemController.fetchImage(from: item.artworkURL)
                        
                        var snapshot = collectionViewDataSource.snapshot()
                        snapshot.reconfigureItems([itemIdentifier])
                        await collectionViewDataSource.apply(snapshot, animatingDifferences: true)
                    } catch {
                        print("Error fetching image: \(error)")
                    }
                }
            }
        }
        collectionViewDataSource = UICollectionViewDiffableDataSource<String, StoreItem.ID>(collectionView: collectionView) { (collectionView, indexPath, identifier) -> UICollectionViewCell? in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }
    }

    @objc func fetchMatchingItems() {
        
        self.items = []
                
        let searchTerm = searchController.searchBar.text ?? ""
        let mediaType = queryOptions[searchController.searchBar.selectedScopeButtonIndex]
        
        // cancel any images that are still being fetched and reset the imageTask dictionaries
        collectionViewImageLoadTasks.values.forEach { task in task.cancel() }
        collectionViewImageLoadTasks = [:]
        tableViewImageLoadTasks.values.forEach { task in task.cancel() }
        tableViewImageLoadTasks = [:]
        
        // cancel existing task since we will not use the result
        searchTask?.cancel()
        searchTask = Task {
            if !searchTerm.isEmpty {
                
                // set up query dictionary
                let query = [
                    "term": searchTerm,
                    "media": mediaType,
                    "lang": "en_us",
                    "limit": "20"
                ]
            
                do {
                    // use the item controller to fetch items
                    let items = try await storeItemController.fetchItems(matching: query)
                    if searchTerm == self.searchController.searchBar.text &&
                          mediaType == queryOptions[searchController.searchBar.selectedScopeButtonIndex] {
                        self.items = items
                    }
                } catch let error as NSError where error.domain == NSURLErrorDomain && error.code == NSURLErrorCancelled {
                    // ignore cancellation errors
                } catch {
                    // otherwise, print an error to the console
                    print(error)
                }
                // apply data source changes
                await tableViewDataSource.apply(self.itemIdentifiersSnapshot, animatingDifferences: true)
                await collectionViewDataSource.apply(self.itemIdentifiersSnapshot, animatingDifferences: true)
            } else {
                await self.tableViewDataSource.apply(self.itemIdentifiersSnapshot, animatingDifferences: true)
                await self.collectionViewDataSource.apply(self.itemIdentifiersSnapshot, animatingDifferences: true)
            }
            searchTask = nil
        }
    }
}
