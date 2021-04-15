//
//  LoginPresentationLogicMock.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 15/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import BooksOnTheTable

class LoginPresentationLogicMock: LoginPresentationLogic {

	// MARK: - Public Variables

	var didCallPresentResponse = false
	var presentResponseCompletionHandler: ((_ response: Login.Login.Response) -> Void)? = nil
	var didCallPresentError = false
	var presentErrorCompletionHandler: ((_ error: Error) -> Void)? = nil

	// MARK: - Public Methods

	func present(response: Login.Login.Response) {
		didCallPresentResponse = true
		presentResponseCompletionHandler?(response)
	}
	
	func present(error: Error) {
		didCallPresentError = true
		presentErrorCompletionHandler?(error)
	}

}
