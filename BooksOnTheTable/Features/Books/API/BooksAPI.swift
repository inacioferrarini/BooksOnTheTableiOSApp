//
//  BookAPI.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 05/04/21.
//

import Foundation
import Awe

protocol BooksAPIProtocol {
	func allBooks(token: String, page: Int, perPage: Int, completion: @escaping ((Result<BookList, Error>) -> Void), retryAttempts: Int)
}

class BooksAPI: BooksAPIProtocol {

	// MARK: - Properties
	
	private let api: API
	
	// MARK: - Init
	
	init(rootUrl: String = BooksConstants.kBooksApiUrl) {
		self.api = API(rootUrl)
	}
		
	// MARK: - Get
	
	func allBooks(token: String, page: Int = 0, perPage: Int = 200, completion: @escaping ((Result<BookList, Error>) -> Void), retryAttempts: Int = 0) {
		
		let targetUrl = "/books?page=\(page)&per=\(perPage)"
		
		api.get(targetUrl: targetUrl,
				requestHeaders: headers(with: token),
				completionHandler: completion,
				retryAttempts: retryAttempts
		)
	}
	
	func get(bookId: String, token: String, completion: @escaping ((Result<Book, Error>) -> Void)) {
		let targetUrl = "/books/\(bookId)"

		api.get(targetUrl: targetUrl,
				requestHeaders: headers(with: token),
				completionHandler: completion,
				retryAttempts: 0
		)
	}
	
	// MARK: - Create
	
	func create(book: Book, token: String, completion: @escaping ((Result<Book, Error>) -> Void)) {
		
		let targetUrl = "/books"
		
		api.post(targetUrl: targetUrl,
				 requestObject: book,
				 requestHeaders: headers(with: token),
				 completionHandler: completion,
				 retryAttempts: 0
		)
	}
	
	// MARK: - Update
	
	func update(book: Book, token: String, completion: @escaping ((Result<Book, Error>) -> Void)) {
		guard let bookId = book.id else { return }
		
		let targetUrl = "/books/\(bookId)"

		api.put(targetUrl: targetUrl,
				requestObject: book,
				requestHeaders: headers(with: token),
				completionHandler: completion,
				retryAttempts: 0
		)		
	}

	// MARK: - Delete
	
	func delete(bookId: String, token: String, completion: @escaping ((Result<String, Error>) -> Void)) {
		let targetUrl = "/books/\(bookId)"
		
		api.delete(targetUrl: targetUrl,
				   requestHeaders: headers(with: token),
				   completionHandler: completion,
				   retryAttempts: 0
		)
	}
	
	// MARK: - Private Methods
	
	private func headers(with token: String) -> [String: String] {
		return [
			"Content-Type": "application/json",
			"Authorization": "Bearer \(token)"
		]
	}

}
