//
//  LoginWorker.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 13/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - Protocols

protocol LoginWorkerProtocol {
	func doLogin(user: User, completion: @escaping LoginWorkerDoLoginCompletionHandler)
}

// MARK: - Typealiases

typealias LoginWorkerDoLoginCompletionHandler = (LoginWorkerResult<Token>) -> Void

// MARK: - Enums

enum LoginWorkerResult<U> {
    case success(result: U)
    case failure(error: LoginWorkerError)
}

// MARK: - Errors

enum LoginWorkerError: Equatable, Error {
	case errorKind(String)
	case loginError
}

class LoginWorker: LoginWorkerProtocol {

	// MARK: - Properties
	
	let tokenAPI: TokenAPIProtocol
	
	// MARK: - Init
	
	init(tokenAPI: TokenAPIProtocol = TokenAPI()) {
		self.tokenAPI = tokenAPI
	}
	
	// MARK: - Public Methods

	func doLogin(user: User, completion: @escaping LoginWorkerDoLoginCompletionHandler) {
		tokenAPI.login(user: user) { (result: Result<Token, Error>) in
			switch result {
			case .success(let token):
				completion(.success(result: token))
			case .failure(_):
				completion(.failure(error: .loginError))
			}
		}
	}
	
}
