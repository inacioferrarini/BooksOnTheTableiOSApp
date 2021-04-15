//
//  LoginPresenterTests.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 15/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import BooksOnTheTable
import XCTest

class LoginPresenterTests: XCTestCase {

	// MARK: Properties

	var sut: LoginPresenter!
//	var sutViewController: LoginDisplayLogicMock!

	// MARK: Overrides

	override func setUp() {
		super.setUp()
		setupLoginPresenter()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: Public Methods

	func setupLoginPresenter() {
//		sutViewController = LoginDisplayLogicMock()
//		sut = LoginPresenter(
//			viewController: sutViewController
//		)
	}

	// MARK: - Present Response

//	func testPresentResponseMustPresentData() {
//		// Given
//		let expectation = XCTestExpectation(description: "PresentResponseCompletion")
//
//		var sutViewModel: Login.UseCase.ViewModel?
//		sutViewController.displayViewModelCompletionHandler = { (_ viewModel: Login.UseCase.ViewModel) in
//			sutViewModel = viewModel
//			expectation.fulfill()
//		}
//
//		let data = LoginData(name: "name")
//		let response = Login.UseCase.Response(value: data)
//
//		// When
//		sut.present(response: response)
//
//		wait(for: [expectation], timeout: 1.0)
//
//		// Then
//		XCTAssertTrue(sutViewController.didCallDisplayViewModel)
//		XCTAssertNotNil(sutViewModel)
//	}

	// MARK: - Present Error

//	func testPresentErrorMustPresentError() {
//		// Given
//		let expectation = XCTestExpectation(description: "PresentErrorCompletion")
//
//		sutViewController.displayErrorCompletionHandler = { _ in
//			expectation.fulfill()
//		}
//
//		let error = LoginWorkerError.errorKind("")
//
//		// When
//		sut.present(error: error)
//		
//		wait(for: [expectation], timeout: 1.0)
//		
//		// Then
//		XCTAssertTrue(sutViewController.didCallDisplayError)
//	}

}
