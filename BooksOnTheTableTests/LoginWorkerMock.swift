//
//  LoginWorkerMock.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 15/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import BooksOnTheTable

class LoginWorkerMock: LoginWorkerProtocol {

	// MARK: - Public Variables

	var didCallDoLogin = false
	var doLoginCompletionHandler: ((_ user: User, _ completion: @escaping LoginWorkerDoLoginCompletionHandler) -> Void)?

	// MARK: - Public Methods
	
	func doLogin(user: User, completion: @escaping LoginWorkerDoLoginCompletionHandler) {
		didCallDoLogin = true
		doLoginCompletionHandler?(user, completion)
	}

}
