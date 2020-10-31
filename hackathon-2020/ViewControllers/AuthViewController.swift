//
//  AuthViewController.swift
//  hackathon-2020
//
//  Created by art-off on 31.10.2020.
//

import UIKit
import SKRadioButton

class AuthViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextFieldView: UIView!
    @IBOutlet weak var passwordTextFieldView: UIView!
    
    @IBOutlet weak var signInButton: UIButton!

    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.darkPurple
        
        setupTextFileds()
        setupButtons()
        setupLabels()
    }
    
    // MARK: - Setup Views
    func setupTextFileds() {
        for textField in [emailTextField, passwordTextField] {
            textField?.textColor = .white
        }

        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        for view in [emailTextFieldView, passwordTextFieldView] {
            view?.layer.cornerRadius = 25
            view?.backgroundColor = Colors.purple
        }
    }
    
    func setupButtons() {
        signInButton.backgroundColor = Colors.gerbRed
        signInButton.layer.cornerRadius = 25
        signInButton.tintColor = .white
    }
    
    func setupLabels() {
        titleLabel.textColor = Colors.gerbRed
        titleLabel.font = UIFont(name: "Yanone Kaffeesatz", size: 55)!
    }
    
}
