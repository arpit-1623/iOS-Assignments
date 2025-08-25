import UIKit

class BookTableViewController: UITableViewController {
    
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell

        let book = books[indexPath.row]
        cell.update(with: book)

        return cell
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        guard let source = segue.source as? BookFormTableViewController,
            let book = source.book else {return}
        
//        if let indexPath = tableView.indexPathForSelectedRow {
//            books.remove(at: indexPath.row)
//            books.insert(book, at: indexPath.row)
//            tableView.deselectRow(at: indexPath, animated: true)
//        } else {
//            books.append(book)
//        }
        
        if let indexPath = tableView.indexPathForSelectedRow {
            // Edit Book
            books[indexPath.row] = book
            tableView.reloadRows(at: [indexPath], with: .fade)
            
        } else {
            // Add Book
            books.append(book)
            let newIndexPath = IndexPath(row: books.count - 1, section: 0)
            tableView.insertRows(at: [newIndexPath], with: .fade)
        }
    }
    
    @IBSegueAction func editBook(_ coder: NSCoder, sender: Any?) -> BookFormTableViewController? {
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }
        
        let book = books[indexPath.row]
        
        return BookFormTableViewController(coder: coder, book: book)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
