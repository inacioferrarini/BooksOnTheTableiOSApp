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
		// load user if I have one
		token = nil
	}
	
}

extension SecurityCoordinator {
	
	private func viewControllerX() -> UIViewController {
		return UIViewController()
	}
	
}

