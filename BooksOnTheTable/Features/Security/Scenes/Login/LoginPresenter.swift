//
//  LoginPresenter.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 13/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - Protocols

protocol LoginPresentationLogic {
	func present(response: Login.Login.Response)
	func present(error: Error)
}

class LoginPresenter: LoginPresentationLogic {

	// MARK: - Properties

	weak var viewController: LoginDisplayLogic?

	// MARK: - Init

	init(viewController: LoginDisplayLogic?) {
		self.viewController = viewController
	}

	// MARK: - Public Methods
	
	func present(response: Login.Login.Response) {
		let viewModel = Login.Login.ViewModel(token: response.token)
		DispatchQueue.main.async { [weak self] in
			self?.viewController?.display(viewModel: viewModel)
		}
	}

	func present(error: Error) {
		DispatchQueue.main.async { [weak self] in
			self?.viewController?.display(error: error)
		}
	}
	
}
