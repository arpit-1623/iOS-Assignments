#  Delegate Backwards Data Passing

1. Define the Protocol: In the parent view controller, define a protocol that declares methods to handle the data sent from the child view controller.

2. Set the Delegate: The parent view controller assigns itself as the delegate of the child view controller.

3. Implement the Delegate Methods: The child view controller calls the delegate method to send data back to the parent view controller.

4. Handle the Data: The parent view controller processes the data in the delegate method.


## Example

- Parent: First View Controller
- Child: Second View Controller

- Send Data From Child to Parent

```swift

class ParentViewController: UIViewController, DataPassingDelegate {  
    @IBOutlet weak var label: UILabel!
    func passDataBack(data: String) {
        // Handle the data sent from the child view controller
        label.text = data
    }
}

class ChildViewController: UIViewController {
    weak var delegate: DataPassingDelegate?
    @IBOutlet weak var textField: UITextField!
    @IBAction func sendDataBack(_ sender: UIButton) { // Pass data back to the parent view controller
            if let data = textField.text {
            delegate?.passDataBack(data: data)
        }
        self.dismiss(animated: true, completion: nil) // Dismiss the child view controller
    }
}

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let childVC = segue.destination as? ChildViewController {
        childVC.delegate = self
    }
}

```
