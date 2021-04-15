//
//  LoginInteractorTests.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 15/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import BooksOnTheTable
import XCTest

class LoginInteractorTests: XCTestCase {

	// MARK: Properties

	var sut: LoginInteractor!
	var sutPresenter: LoginPresentationLogicMock!
	var sutWorker: LoginWorkerMock!

	// MARK: Overrides

	override func setUp() {
		super.setUp()
		setupLoginInteractor()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: Public Methods

	func setupLoginInteractor() {
		sutPresenter = LoginPresentationLogicMock()
		sutWorker = LoginWorkerMock()
		sut = LoginInteractor(
			presenter: sutPresenter,
			worker: sutWorker
		)
	}

	// MARK: - doLogin

	func testDoLoginSuccessMustCallPresenter() {
		// Given
		let expectation = XCTestExpectation(description: "DoLoginCompletion")
		sutPresenter.presentResponseCompletionHandler = { (_ response: Login.Login.Response) in
			expectation.fulfill()
		}

		sutWorker.doLoginCompletionHandler = { (_ user: User, _ completion: @escaping LoginWorkerDoLoginCompletionHandler) in
			let result = Token(token: "",
							   creationDate: Date(),
							   expirationDate: Date()
			)
			completion(.success(result: result))
		}

		let user = User(name: "", email: "", password: "")
		let request = Login.Login.Request(user: user)

		// When
		sut.doLogin(request: request)

		wait(for: [expectation], timeout: 1.0)

		// Then
	 	XCTAssertTrue(sutPresenter.didCallPresentResponse)
		XCTAssertTrue(sutWorker.didCallDoLogin)
	}

	func testDoLoginFailureMustCallPresenter() {
		// Given
		let expectation = XCTestExpectation(description: "DoLoginCompletion")
		sutPresenter.presentErrorCompletionHandler = { (_ error: Error) in
			expectation.fulfill()
		}

		sutWorker.doLoginCompletionHandler = { (_ user: User, _ completion: @escaping LoginWorkerDoLoginCompletionHandler) in
			completion(.failure(error: .errorKind("Mocked Error")))
		}
		
		let user = User(name: "", email: "", password: "")
		let request = Login.Login.Request(user: user)

		// When
		sut.doLogin(request: request)

		wait(for: [expectation], timeout: 1.0)

		// Then
		XCTAssertTrue(sutPresenter.didCallPresentError)
		XCTAssertTrue(sutWorker.didCallDoLogin)
	}

}
