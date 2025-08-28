//
//  AddRegistrationTableViewController.swift
//  L35_ComplexInputScreens
//
//  Created by Arpit Garg on 27/08/25.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    var roomType: RoomType?
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    @IBOutlet weak var nightsLabel: UILabel!
    @IBOutlet weak var nightSubLabel: UILabel!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var roomSubLabel: UILabel!
    @IBOutlet weak var wifiLabel: UILabel!
    @IBOutlet weak var wifiSubLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    // Date Label Index Paths
    let checkInLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkOutLabelCellIndexPath = IndexPath(row: 2, section: 1)
    
    // Date Picker Index Paths
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    // State of Date Pickers
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    // Registrations
    var registration: Registration? {
        guard let roomType = roomType else {
            return nil
        }
        
        let firstName = firstNameField.text ?? ""
        let lastName = lastNameField.text ?? ""
        let email = emailField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        
        return Registration(
            firstName: firstName,
            lastName: lastName,
            emailAddress: email,
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
            numberOfAdults: numberOfAdults,
            numberOfChildren: numberOfChildren,
            wifi: hasWifi,
            roomType: roomType
        )
        
    }
    
    var editingRegistration: Registration?
    var editingIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMinimumDate()
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
        
        if let reg = editingRegistration {
            firstNameField.text = reg.firstName
            lastNameField.text = reg.lastName
            emailField.text = reg.emailAddress
            checkInDatePicker.date = reg.checkInDate
            checkOutDatePicker.date = reg.checkOutDate
            numberOfAdultsStepper.value = Double(reg.numberOfAdults)
            numberOfChildrenStepper.value = Double(reg.numberOfChildren)
            wifiSwitch.isOn = reg.wifi
            roomType = reg.roomType
            
            updateDateViews()
            updateNumberOfGuests()
            updateRoomType()
            updateSummary()
        }
    }
    
    func setMinimumDate() {
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)
    }
    
    func updateDateViews() {
        checkInDateLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        checkOutDateLabel.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
    }
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
        updateSummary()
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        let firstName = firstNameField.text ?? ""
        let lastName = lastNameField.text ?? ""
        let email = emailField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        let roomChoice = roomType?.name ?? "Not Set"
        
        print("DONE TAPPED")
        print("First Name: \(firstName)")
        print("Last Name: \(lastName)")
        print("Email: \(email)")
        print("Check-In Date: \(checkInDate)")
        print("Check-Out Date: \(checkOutDate)")
        print("Number of Adults: \(numberOfAdults)")
        print("Number of Children: \(numberOfChildren)")
        print("Wi-Fi: \(hasWifi ? "Yes" : "No")")
        print("Room Type: \(roomChoice)")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
            case checkInDatePickerCellIndexPath where isCheckInDatePickerVisible == false:
                return 0
            case checkOutDatePickerCellIndexPath where isCheckOutDatePickerVisible == false:
                return 0
            default:
                return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath:
            return 190
        case checkOutDatePickerCellIndexPath:
            return 190
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if indexPath == checkInLabelCellIndexPath {
            isCheckInDatePickerVisible.toggle()
            if isCheckInDatePickerVisible { isCheckOutDatePickerVisible = false }
        } else if indexPath == checkOutLabelCellIndexPath {
            isCheckOutDatePickerVisible.toggle()
            if isCheckOutDatePickerVisible { isCheckInDatePickerVisible = false }
        } else {
            return
        }

        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
        updateSummary()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        updateSummary()
    }
    
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        } else {
            roomTypeLabel.text = "Not Set"
        }
    }
    
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType) {
        self.roomType = roomType
        
        updateRoomType()
        updateSummary()
    }
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let selectRoomTypeController = SelectRoomTypeTableViewController(coder: coder)
        
        selectRoomTypeController?.delegate = self
        selectRoomTypeController?.roomType = roomType
        
        return selectRoomTypeController
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateSummary() {
        guard let registration = registration else { return }
        guard let roomRate = roomType?.price else { return }
        guard let roomType = roomType?.name else { return }
        
        let numberOfNights = Calendar.current.dateComponents([.day], from: registration.checkInDate, to: registration.checkOutDate).day ?? 0
        let roomCost = registration.roomType.price
        let rentCost = roomCost * numberOfNights
        let wifiCost = registration.wifi ? 10 : 0
        let totalCost = (roomCost + wifiCost) * numberOfNights
        
        nightsLabel.text = "\(numberOfNights) night\(numberOfNights > 1 ? "s" : "")"
        nightSubLabel.text = "\(registration.checkInDate.formatted(date: .numeric, time: .omitted)) - \(registration.checkOutDate.formatted(date: .numeric, time: .omitted))"
        
        roomLabel.text = "$ \(rentCost)"
        roomSubLabel.text = "\(roomType) @ $\(roomRate)/night"
        
        wifiLabel.text = "$ \(registration.wifi ? (10 * numberOfNights) : 0)"
        wifiSubLabel.text = registration.wifi ? "Yes" : "No"
        
        totalLabel.text = "$ \(totalCost)"
    }
}
