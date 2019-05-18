//
//  AddActivityViewController.swift
//  Activity Manager
//
//  Created by Bruno Pastre on 15/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import UIKit

class AddActivityViewController: BaseEditableViewController, UIPickerViewDataSource, UIPickerViewDelegate {


    @IBOutlet weak var priorityPicker: UIPickerView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
//    @IBOutlet weak var shortNameTextField: UITextField!
//    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var contentView: UIView!
    
    
    let pickerOptions: [String]! = ["Low", "Medium", "High"]
    var selectedIndex: Int! = 0
    var keyboardHeight: CGFloat! = 75.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.content = self.contentView
        self.doneButton.isEnabled = false
        
        self.priorityPicker.dataSource = self
        self.priorityPicker.delegate = self
        
        self.nameTextField.delegate = self
//        self.descriptionTextField.delegate = self
//        self.shortNameTextField.delegate = self
        
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }

    
    
    
    // MARK: - Picker delegates
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerOptions.count
        
//        return Array(Priority.AllCases).count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        print(row, component)
        return self.pickerOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedIndex = row
        print("Selecionou", self.selectedIndex!)
    }
    
    
    // MARK: - TextField delegates
    
    func validateTextField(textField: UITextField){
        if textField == self.nameTextField{
            if textField.hasText{
                self.doneButton.isEnabled = true
            }else{
                self.doneButton.isEnabled = false
            }
        }
    }
    
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        super.textFieldDidEndEditing(textField)
        self.validateTextField(textField: textField)
    }

    // MARK: - Button callbacks
    
    @IBAction func onDone(_ sender: Any) {
        let priority = self.pickerOptions[self.selectedIndex]
        let activity = Activity(title: self.nameTextField.text, priority: priority)
        ActivityProvider.instance.addActivity(newActivity: activity)
        self.controller.tableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
