//
//  ViewController.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 31/03/21.
//

import UIKit

class X: NSObject, UICollectionViewDataSource {

	func setup() {
		var allBooks: [Book] = []
		var reading = allBooks.filter({ return $0.status == .reading })
		var done = allBooks.filter({ return $0.status == .done })
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if section == 0 {
			return reading.count
		} else if section == 1 {
			return done.count
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		indexPath.section == 0 {
			reading[indexPath.item]
		}		
	}
	
}


class ViewController1: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	
	var pickerView: UIPickerView! = UIPickerView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		pickerView.delegate = self
		pickerView.dataSource = self
	}
	
	var nameList: [String] = [] {
		didSet {
			guard let pickerView = pickerView else { return }
			pickerView.reloadAllComponents()
		}
	}
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return nameList.count
	}

	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return nameList[row]
	}
	
}


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
		
		let vc = ViewController1()
		vc.nameList = []
		
		var book = Book(id: "", title: "", authorName: "", genre: .horror, status: .reading)
		book.authorName = ""
		
		
		DispatchQueue.global().async {
			self.authenticate(with: user) { (result: Result<Token, Error>) in
				switch result {
				case .success(let token):
					self.fetchBooks(with: token) { (result: Result<BookList, Error>) in
						switch result {
						case .success(let bookList):
							if var firstBook = bookList.bookList.first {
								debugPrint("first: \(firstBook)")
								firstBook.title = "first book update"
								self.booksAPI.update(book: firstBook, token: token.token) { (result: Result<Book, Error>) in
									switch result {
									case .success(let book):
										debugPrint("book: \(book)")
									case .failure(let error):
										debugPrint("error: \(error)")
									}
								}
							}
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
		
		let vc = ViewController1()
		vc.nameList = ["option 1", "option 2", "option 3", "option 4"]
	}

}

extension ViewController: LoginFieldsViewDelegate {
	
	func loginFieldsView(_ loginFieldsView: LoginFieldsView, didProvided credential: LoginCredential) {
		debugPrint("Auth: \(credential.login), \(credential.password)")
	}
	
	
}
