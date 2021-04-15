//
//  LoginViewControllerTests.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 15/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import BooksOnTheTable
import XCTest

class LoginViewControllerTests: XCTestCase {
	
	// MARK: Properties

	var sut: LoginViewController!
//	var sutInteractor: LoginBusinessLogicMock!
	var window: UIWindow!

	// MARK: Overrides

	override func setUp() {
		super.setUp()
		window = UIWindow()
		setupLoginViewController()
	}

	override func tearDown() {
		window = nil
		super.tearDown()
	}

	// MARK: Public Methods

	func setupLoginViewController() {
//		sutInteractor = LoginBusinessLogicMock()

		let bundle = Bundle.main
		let storyboard = UIStoryboard(name: "Login", bundle: bundle)
		sut = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
		
//		sut.interactor = sutInteractor
	}

	func loadView() {
		window.addSubview(sut.view)
		RunLoop.current.run(until: Date())
		let _ = sut.view
	}

	// MARK: - Init

//	func testInitFromNibBundleMustCallSetup() {
//		// Given
//		sut = LoginViewController(nibName: nil, bundle: nil)
//		
//		// When
//		loadView()
//		
//		// Then
//		XCTAssertNotNil(sut.interactor)
//	}
	
	// MARK: - viewDidLoad
	
//	func testViewDidLoadMustCallDoSomething() {
//		// Given
//		
//		// When
//		loadView()
//
//		// Then
//		XCTAssertTrue(sutInteractor.didCallDoSomething)
//	}
	
	// MARK: - display

//	func testDisplayMustDisplayData() {
//		// Given
//		
//		// When
//		loadView()
//		sut.display(viewModel: Login.UseCase.ViewModel(name: "Name 01"))
//		
//		// Then
//		XCTAssertEqual(sut.nameLabel.text, "Name 01")
//	}
	
	// MARK: - display error
	
//	func testDisplayErrorMustDisplayError() {
//		// Given
//
//		// When
//		loadView()
//		sut.display(error: LoginWorkerError.errorKind("Error"))
//
//		// Then
//		XCTAssertTrue(sut.presentedViewController is UIAlertController)
//	}

}
