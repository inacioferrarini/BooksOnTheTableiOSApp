//
//  TesteCleanCVCRouter.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 07/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol TesteCleanCVCRoutingLogic {
	func routeToAnotherScene()
}

protocol TesteCleanCVCDataPassing {
	var dataStore: TesteCleanCVCDataStore { get }
}

class TesteCleanCVCRouter: TesteCleanCVCDataPassing {

	// MARK: - Properties

	let dataStore: TesteCleanCVCDataStore
	let sceneNavigator: UINavigationController?

	// MARK: - Init

	init(
	    dataStore: TesteCleanCVCDataStore,
		sceneNavigator: UINavigationController?
	) {
		self.dataStore = dataStore
		self.sceneNavigator = sceneNavigator
	}

}

extension TesteCleanCVCRouter: TesteCleanCVCRoutingLogic {
	
	func routeToAnotherScene() {
		let storyboard = UIStoryboard(name: "TesteCleanCVC", bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: "TesteCleanCVCViewController")

		// sceneViewController setup

		DispatchQueue.main.async { [weak self] in
			self?.sceneNavigator?.pushViewController(
				viewController,
				animated: true
			)
		}
	}

}
