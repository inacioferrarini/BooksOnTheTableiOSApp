//
//  MainCoordinator.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 12/04/21.
//

import UIKit

class MainCoordinator {
	
	// Properties
	
	let navigationController: UINavigationController
	let securityCoordinator: SecurityCoordinator
	let booksCoordinator: BooksCoordinator
		
	// MARK: - Init
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
		self.securityCoordinator = SecurityCoordinator(navigationController: navigationController)
		self.booksCoordinator = BooksCoordinator(navigationController: navigationController)
	}
	
	// MARK: - Public Methods

	func start() {
		let token = securityCoordinator.token
		if let token = token {
			booksCoordinator.token = token
			booksCoordinator.start()
		} else {
			securityCoordinator.start()
		}
	}
	
}
