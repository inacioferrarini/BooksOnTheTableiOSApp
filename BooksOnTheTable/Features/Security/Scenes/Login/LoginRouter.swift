//
//  LoginRouter.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 13/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol LoginRoutingLogic {
	func routeToAnotherScene()
}

protocol LoginDataPassing {
	var dataStore: LoginDataStore { get }
}

class LoginRouter: LoginDataPassing {

	// MARK: - Properties

	let dataStore: LoginDataStore
	let sceneNavigator: UINavigationController?

	// MARK: - Init

	init(
	    dataStore: LoginDataStore,
		sceneNavigator: UINavigationController?
	) {
		self.dataStore = dataStore
		self.sceneNavigator = sceneNavigator
	}

}

extension LoginRouter: LoginRoutingLogic {
	
	func routeToAnotherScene() {
		let storyboard = UIStoryboard(name: "Login", bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")

		// sceneViewController setup

		DispatchQueue.main.async { [weak self] in
			self?.sceneNavigator?.pushViewController(
				viewController,
				animated: true
			)
		}
	}

}
