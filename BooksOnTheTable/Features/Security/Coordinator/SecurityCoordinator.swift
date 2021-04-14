//
//  SecurityCoordinator.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 12/04/21.
//

import UIKit

class SecurityCoordinator {

	// Constants
	
	let kTokenKey = "securityToken"
	
	// Properties
	
	let navigationController: UINavigationController
	let keychain = KeychainSwift()
	
	public private(set) var token: Token? {
		get {
			var token: Token?
			if let tokenData = keychain.getData(kTokenKey) {
				let decoder = JSONDecoder()
				token = try? decoder.decode(Token.self, from: tokenData)
			}
			return token
		}
		set {
			let encoder = JSONEncoder()
			if let token = newValue,
			   let tokenData = try? encoder.encode(token) {
				keychain.set(tokenData, forKey: kTokenKey)
			} else {
				keychain.delete(kTokenKey)
			}
		}
	}
	
	// MARK: - Init
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	// MARK: - Public Methods
	
	func start() {
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
		self.token = token
		self.navigationController.popViewController(animated: true)
	}

}
