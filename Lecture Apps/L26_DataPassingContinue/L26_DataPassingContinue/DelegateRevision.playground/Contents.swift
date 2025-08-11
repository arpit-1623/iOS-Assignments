import UIKit

// Protocol
protocol DelegateDataPassing {
    func passData(data: String?)
}

// Delegate - Receives Data
class FirstViewController : DelegateDataPassing {
    
    var dataInFirstViewController: String?
    
    func passData(data: String?) {
        dataInFirstViewController = data
    }
}

// Delegator - Sends Data
class SecondViewController {
    var dataInSecondViewController: String?
    var delegate: DelegateDataPassing?
    
    func passDataToFirstViewController(data: String?) {
        delegate?.passData(data: dataInSecondViewController)
    }
}

// Usage
var secondViewController        = SecondViewController()
var firstViewController         = FirstViewController()

secondViewController.delegate   = firstViewController

secondViewController.dataInSecondViewController = "Hello from Second View Controller!"
secondViewController.passDataToFirstViewController(data: secondViewController.dataInSecondViewController)

print(firstViewController.dataInFirstViewController ?? "No data received in First View Controller.")
