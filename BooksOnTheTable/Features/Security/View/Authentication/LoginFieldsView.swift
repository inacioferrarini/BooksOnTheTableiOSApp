//
//  LoginFieldsView.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 09/04/21.
//

import UIKit

typealias LoginCredential = (login: String, password: String)

protocol LoginFieldsViewDelegate: AnyObject {
	func loginFieldsView(_ loginFieldsView: LoginFieldsView, didProvided credential: LoginCredential)
}

@IBDesignable
class LoginFieldsView: XibView {
	
	// MARK: - Outlets
	
	@IBOutlet private weak var loginLabel: UILabel!
	@IBOutlet private weak var passwordLabel: UILabel!
	
	@IBOutlet private weak var loginTextField: UITextField!
	@IBOutlet private weak var passwordTextField: UITextField!
	@IBOutlet private weak var loginButton: UIButton!
	
	// MARK: - Properties
	
	weak var delegate: LoginFieldsViewDelegate?
	
	@IBInspectable
	var loginFieldTitle: String {
		get {
			return loginLabel.text ?? ""
		}
		set {
			loginLabel.text = newValue
		}
	}
	
	@IBInspectable
	var passwordFieldTitle: String {
		get {
			return passwordLabel.text ?? ""
		}
		set {
			passwordLabel.text = newValue
		}
	}
	
	@IBInspectable
	var loginButtonTitle: String {
		get {
			return passwordLabel.text ?? ""
		}
		set {
			loginButton.setTitle(newValue, for: .normal)
			passwordLabel.text = newValue
		}
	}

	// MARK: - Action
	
	@IBAction func handleLogin() {
		let loginCredential = LoginCredential(login: loginTextField.text ?? "", password: passwordTextField.text ?? "")
		delegate?.loginFieldsView(self, didProvided: loginCredential)
	}
		
}
