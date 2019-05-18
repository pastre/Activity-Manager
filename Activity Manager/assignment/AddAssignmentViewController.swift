//
//  AddAssignemntViewController.swift
//  Activity Manager
//
//  Created by Bruno Pastre on 16/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import UIKit

class AddAssignmentViewController: BaseEditableViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var shortNameTextField: UITextField!
    
    var activity: Activity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton.isEnabled = false
        self.content = contentView
        nameTextField.delegate = self
        shortNameTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    


    // MARK: - TextField delegates
    func validateTextField(textField: UITextField){
        if self.nameTextField.hasText && self.shortNameTextField.hasText{
            self.doneButton.isEnabled = true
        }else{
            self.doneButton.isEnabled = false
        }
    }
    
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        super.textFieldDidEndEditing(textField)
        self.validateTextField(textField: textField)
    }

    // MARK: - Button callbacks
    
    @IBAction func onDone(_ sender: Any) {
        let assignment = Activity(title: self.nameTextField.text, priority: self.shortNameTextField.text)
        ActivityProvider.instance.addAssignment(assignment: assignment, to: self.activity)
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
