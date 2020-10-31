//
//  RegistrationViewController.swift
//  hackathon-2020
//
//  Created by art-off on 31.10.2020.
//

import UIKit
import SKRadioButton

class RegistrationViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var patronymicTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet weak var lastNameTextFieldView: UIView!
    @IBOutlet weak var firstNameTextFieldView: UIView!
    @IBOutlet weak var patronymicTextFieldView: UIView!
    @IBOutlet weak var dateOfBirthTextFieldView: UIView!
    @IBOutlet weak var emailTextFieldView: UIView!
    @IBOutlet weak var passwordTextFieldView: UIView!
    @IBOutlet weak var repeatPawwordTextFieldView: UIView!
    
    @IBOutlet var genderRadioButtons: [SKRadioButton]!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        if #available(iOS 13.4, *) {
            dp.preferredDatePickerStyle = .wheels
        }
        return dp
    }()
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.darkPurple
        
        setupTextFileds()
        setupButtons()
        setupLabels()
        
        setupDatePicker()
    }
    
    // MARK: - Setup Views
    func setupTextFileds() {
        for textField in [lastNameTextField, firstNameTextField, patronymicTextField, dateOfBirthTextField, emailTextField, passwordTextField, repeatPasswordTextField] {
            textField?.textColor = .white
        }
        
        lastNameTextField.attributedPlaceholder = NSAttributedString(string: "Фамилия", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        firstNameTextField.attributedPlaceholder = NSAttributedString(string: "Имя", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        patronymicTextField.attributedPlaceholder = NSAttributedString(string: "Отчество", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        dateOfBirthTextField.attributedPlaceholder = NSAttributedString(string: "Дата рождения", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        repeatPasswordTextField.attributedPlaceholder = NSAttributedString(string: "Повторите пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        for view in [lastNameTextFieldView, firstNameTextFieldView, patronymicTextFieldView, dateOfBirthTextFieldView, emailTextFieldView, passwordTextFieldView, repeatPawwordTextFieldView] {
            view?.layer.cornerRadius = 25
            view?.backgroundColor = Colors.purple
        }
    }
    
    func setupButtons() {
        genderRadioButtons.forEach { button in
            button.iconColor = Colors.gerbRed
        }
        
        signUpButton.backgroundColor = Colors.gerbRed
        signUpButton.layer.cornerRadius = 25
        signUpButton.tintColor = .white
    }
    
    func setupLabels() {
        titleLabel.textColor = Colors.gerbRed
        titleLabel.font = UIFont(name: "Yanone Kaffeesatz", size: 55)!
    }
    
    func setupDatePicker() {
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelDatePicker))
        
        toolbar.setItems([doneButton, spaceButton, cancelButton], animated: false)
        
        dateOfBirthTextField.inputAccessoryView = toolbar
        dateOfBirthTextField.inputView = datePicker
    }
    
    @objc func donedatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        dateOfBirthTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
    }

    @IBAction func genderRadioButtonTapped(_ sender: SKRadioButton) {
        genderRadioButtons.forEach { (button) in
            button.isSelected = false
        }
        sender.isSelected = true
    }
}
