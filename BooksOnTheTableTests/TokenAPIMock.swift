//
//  TokenAPIMock.swift
//  BooksOnTheTableTests
//
//  Created by José Inácio Athayde Ferrarini on 15/04/21.
//

@testable import BooksOnTheTable

class TokenAPIMock: TokenAPIProtocol {

	// MARK: - Public Variables

	var didCallDoLogin = false
	var doLoginCompletionHandler: ((_ user: User, _ completion: @escaping ((Result<Token, Error>) -> Void)) -> Void)?

	// MARK: - Public Methods

	func login(user: User, completion: @escaping ((Result<Token, Error>) -> Void)) {
		didCallDoLogin = true
		doLoginCompletionHandler?(user, completion)
	}
	
}
