//
//  UINavigationControllerSpy.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 15/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import BooksOnTheTable
import UIKit

class UINavigationControllerSpy: UINavigationController {

	// MARK: - Public Variables

	var didCallPopViewController = false
	var popViewControllerCompletionHandler: ((_ animated: Bool) -> UIViewController?)? = nil
	var didCallPushViewController = false
	var pushViewControllerCompletionHandler: ((_ viewController: UIViewController, _ animated: Bool) -> Void)? = nil
	
	// MARK: - Public Methods

	override func popViewController(animated: Bool) -> UIViewController? {
		didCallPopViewController = true
		var viewController: UIViewController?
		if let returnedViewController = popViewControllerCompletionHandler?(animated) {
			viewController = returnedViewController
		}
		return viewController
	}

	override func pushViewController(_ viewController: UIViewController, animated: Bool) {
		didCallPushViewController = true
		pushViewControllerCompletionHandler?(viewController, animated)
	}

}