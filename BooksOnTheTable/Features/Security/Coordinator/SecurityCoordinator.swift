//
//  SecurityCoordinator.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 12/04/21.
//

import UIKit

class SecurityCoordinator {
	
	// Properties
	
	let navigationController: UINavigationController
	
	public private(set) var token: Token?
	
	// MARK: - Init
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	// MARK: - Public Methods
	
	func start() {
		token = nil
		guard let loginViewController = self.loginViewController() else { return }
		self.navigationController.pushViewController(loginViewController, animated: true)		
	}
	
}

extension SecurityCoordinator: LoginSceneDelegate {

	private func loginViewController() -> LoginViewController? {
		let storyboard = UIStoryboard(
			name: "Login",
			bundle: nil
		)
		let viewController = storyboard.instantiateViewController(
			withIdentifier: "LoginViewController"
		) as? LoginViewController
		
		viewController?.sceneDelegate = self
		
		return viewController
	}
	
	func loginScene(_ loginScene: LoginViewController, didAuthenticateWith token: Token) {
		debugPrint("@ Received Token: \(token)")
		self.navigationController.popViewController(animated: true)
	}

}
