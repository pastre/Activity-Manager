//
//  BaseEditableViewController.swift
//  Activity Manager
//
//  Created by Bruno Pastre on 16/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import UIKit

class BaseEditableViewController: UIViewController, UITextFieldDelegate {
    
    var content: UIView!
    var controller: UITableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.descriptionTextField.delegate = self
        //        self.shortNameTextField.delegate = self
        
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Keyboard listeners
    
    func moveKeyboardUp(){
        
        self.content.transform = self.content.transform.translatedBy(x: 0, y: -self.view.frame.width / 2)
        
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.content.transform = .identity
    }
    
    // MARK: - TextField delegates
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.moveKeyboardUp()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Comecou a editar")
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Acabou de editar!!!")
        self.content.transform = .identity
    }
    
    // MARK: - Button callbacks
}
