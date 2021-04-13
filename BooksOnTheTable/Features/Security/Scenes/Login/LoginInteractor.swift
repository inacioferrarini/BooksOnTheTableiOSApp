//
//  LoginInteractor.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 13/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - Protocols

protocol LoginBusinessLogic {
	func doLogin(request: Login.Login.Request)
}

protocol LoginDataStore {
	//var property: String { get set }
}

class LoginInteractor: LoginDataStore {

	// MARK: - Properties

	let presenter: LoginPresentationLogic
	let worker: LoginWorkerProtocol
	//var property: String = ""

	// MARK: - Init

	init(
		presenter: LoginPresentationLogic,
		worker: LoginWorkerProtocol = LoginWorker()
	) {
		self.presenter = presenter
		self.worker = worker
	}

}

extension LoginInteractor: LoginBusinessLogic {
	
	func doLogin(request: Login.Login.Request) {
		DispatchQueue.global().async { [weak self] in
			self?.worker.doLogin(user: request.user, completion: { (result: LoginWorkerResult<Token>) in
				switch result {
				case .success(let token):
					let response = Login.Login.Response(token: token)
					self?.presenter.present(response: response)
				case .failure(let error):
					self?.presenter.present(error: error)
				}
			})
		}
	}

}
