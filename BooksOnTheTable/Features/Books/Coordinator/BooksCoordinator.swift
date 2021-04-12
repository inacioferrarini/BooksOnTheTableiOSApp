//
//  BooksCoordinator.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 12/04/21.
//

import UIKit

class BooksCoordinator {
	
	// Properties
	
	let navigationController: UINavigationController
	public var token: Token?
	
	// MARK: - Init
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	// MARK: - Public Methods
	
	func start() {
		// start your first ViewController Here
	}
	
}

extension BooksCoordinator {
	
	private func viewControllerX() -> UIViewController {
		return UIViewController()
	}
	
}
