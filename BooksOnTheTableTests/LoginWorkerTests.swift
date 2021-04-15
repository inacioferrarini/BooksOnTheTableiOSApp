//
//  LoginWorkerTests.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 15/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import BooksOnTheTable
import XCTest

class LoginWorkerTests: XCTestCase {

	// MARK: Properties

	var sut: LoginWorker!
	var sutAPI: TokenAPIMock!

	// MARK: Overrides

	override func setUp() {
		super.setUp()
		setupLoginWorker()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: Public Methods

	func setupLoginWorker() {
		sutAPI = TokenAPIMock()
		sut = LoginWorker(tokenAPI: sutAPI)
	}

	func message(from error: LoginWorkerError) -> String? {
		switch error {
		case .errorKind(let message):
			return message
		case .loginError:
			return String(describing: error)
		}
	}

	// MARK: - doLogin

	func testDoLoginSuccessMustReturnData() {
		// Given
		let expectation = XCTestExpectation(description: "DoLoginCompletion")

		sutAPI.doLoginCompletionHandler = { (_ user: User, _ completion: @escaping ((Result<Token, Error>) -> Void)) in
			let token = Token(token: "", creationDate: Date(), expirationDate: Date())
			completion(.success(token))
		}
		
		let user = User(name: "", email: "", password: "")
		
		// When
		var value: Token? = nil
		
		sut.doLogin(user: user) { (completion: LoginWorkerResult<Token>) in
			switch completion {
			case .success(let returnedValue):
				value = returnedValue
				expectation.fulfill()
			default:
				XCTFail(".failure was not expected to be called")
			}
		}
		
		wait(for: [expectation], timeout: 1.0)

		// Then
		XCTAssertNotNil(value)
	}

	 func testDoLoginFailureMustReturnError() {
	 	// Given
	 	let expectation = XCTestExpectation(description: "DoLoginCompletion")

		sutAPI.doLoginCompletionHandler = { (_ user: User, _ completion: @escaping ((Result<Token, Error>) -> Void)) in
			completion(.failure(LoginWorkerError.loginError))
		}
		
		let user = User(name: "", email: "", password: "")
		
	 	// When
	 	var error: Error?
	 	var errorMessage: String?

		sut.doLogin(user: user) { [weak self] (completion: LoginWorkerResult<Token>) in
			switch completion {
				case .failure(let returnedError):
					errorMessage = self?.message(from: returnedError)
					error = returnedError
					expectation.fulfill()
				default:
					XCTFail(".success should not be called in this case")
			}
		}
		
	 	wait(for: [expectation], timeout: 1.0)

	 	// Then
	 	XCTAssertNotNil(error)
	 	XCTAssertNotNil(errorMessage)
	 	XCTAssertEqual(errorMessage ?? "", "loginError")
	 }

}
