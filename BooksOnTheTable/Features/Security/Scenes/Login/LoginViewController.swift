//
//  LoginViewController.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 13/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol LoginDisplayLogic: class {
	func display(viewModel: Login.Login.ViewModel)
	func display(error: Error)
}

class LoginViewController: UIViewController {

	// MARK: - Properties

	var interactor: LoginBusinessLogic?
	var router: (LoginRoutingLogic & LoginDataPassing)?

	// MARK: - Outlets

	@IBOutlet weak var loginFormFields: LoginFieldsView!
	@IBOutlet weak var courtainView: UIView!
	@IBOutlet weak var courtainViewSpinnerView: UIView!
	
	weak var sceneDelegate: LoginSceneDelegate?
	
	// MARK: - Init

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		setup()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
	
	// MARK: - Overrides

	override func viewDidLoad() {
		super.viewDidLoad()
		loginFormFields.delegate = self
		
		courtainViewSpinnerView.layer.cornerRadius = 10
		courtainViewSpinnerView.clipsToBounds = true
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		loginFormFields.requestFocus()
	}
	
 	// MARK: - Actions
 
    // @IBAction func ...

	// MARK: - Private Methods

	private func setup() {
		let viewController = self
		let sceneNavigator = viewController.navigationController
		let presenter = LoginPresenter(viewController: viewController)
		let interactor = LoginInteractor(presenter: presenter)
		let router = LoginRouter(dataStore: interactor, sceneNavigator: sceneNavigator)
		viewController.interactor = interactor
		viewController.router = router
	}

}

extension LoginViewController: LoginDisplayLogic {

	func display(viewModel: Login.Login.ViewModel) {
		courtainView.isHidden = true
		loginFormFields.resetFields()
		sceneDelegate?.loginScene(self, didAuthenticateWith: viewModel.token)
	}
	
	func display(error: Error) {
		courtainView.isHidden = true
		let alert = UIAlertController(
			title: title,
			message: String(describing: error),
			preferredStyle: .alert
		)
		let okAction = UIAlertAction(
			title: "OK",
			style: .default
		)
		alert.addAction(okAction)
		present(alert, animated: true, completion: nil)
	}

	func doLogin(user: User) {
		let request = Login.Login.Request(user: user)
		interactor?.doLogin(request: request)
	}
	
}

extension LoginViewController: LoginFieldsViewDelegate {
	
	func loginFieldsView(_ loginFieldsView: LoginFieldsView, didProvided credential: LoginCredential) {
		
		let user = User(from: credential)
		doLogin(user: user)
		courtainView.isHidden = false
	}
	
}
