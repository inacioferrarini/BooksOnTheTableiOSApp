//
//  ViewController.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 31/03/21.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - Properties
//	let api = APIs()
	
	let tokenAPI = TokenAPI()
	let booksAPI = BooksAPI()
	
	@IBOutlet weak var pushButton: UIButton!
	@IBOutlet weak var presentButton: UIButton!
	@IBOutlet weak var loginFieldsView: LoginFieldsView!
	
	// MARK: - Lifecycle

	func authenticate(with user: User, completion: @escaping ((Result<Token, Error>) -> Void)) {
		tokenAPI.login(user: user, completion: completion)
	}
	
	func fetchBooks(with token: Token, completion: @escaping ((Result<BookList, Error>) -> Void)) {
		booksAPI.allBooks(token: token.token, completion: completion)
	}
	
	func fetchBookInChain() {
		let user = User(name: "",
						email: "user@email.com",
						password: "12345678"
		)
		
		DispatchQueue.global().async {
			self.authenticate(with: user) { (result: Result<Token, Error>) in
				switch result {
				case .success(let token):
					self.fetchBooks(with: token) { (result: Result<BookList, Error>) in
						switch result {
						case .success(let bookList):
							debugPrint("returned books: \(bookList.bookList)")
							break
						case .failure(let error):
							debugPrint("Error: \(error)")
						}
					}
				case .failure(let error):
					debugPrint("error: \(error)")
				}
			}
		}
	}
	
	func fetchBookWithWait() {
		let dispatchGroup = DispatchGroup()
		let user = User(name: "",
						email: "user@email.com",
						password: "12345678"
		)
		
		var token: Token?
		
		DispatchQueue.global().async {
			dispatchGroup.enter()
			self.authenticate(with: user) { (result: Result<Token, Error>) in
				switch result {
				case .success(let returnedToken):
					token = returnedToken
					dispatchGroup.leave()
				case .failure(let error):
					debugPrint("error: \(error)")
					dispatchGroup.leave()
				}
			}

			dispatchGroup.wait()
			
			guard let token = token else {
				debugPrint("NO TOKEN. Aborting")
				return
			}
			
			self.fetchBooks(with: token) { (result: Result<BookList, Error>) in
				switch result {
				case .success(let bookList):
					debugPrint("returned books: \(bookList.bookList)")
					break
				case .failure(let error):
					debugPrint("Error: \(error)")
				}
			}
			
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		loginFieldsView.delegate = self

		// Uses the Chain Model
//		fetchBookInChain()
		
		// Use the Wait Model
//		fetchBookWithWait()
	}

}

extension ViewController: LoginFieldsViewDelegate {
	
	func loginFieldsView(_ loginFieldsView: LoginFieldsView, didProvided credential: LoginCredential) {
		debugPrint("Auth: \(credential.login), \(credential.password)")
	}
	
	
}
