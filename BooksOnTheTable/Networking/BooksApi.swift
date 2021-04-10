//
//  BooksApi.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 05/04/21.
//

import Awe

class BooksAPI: API {
	
	func allBooks(token: String, page: Int = 0, perPage: Int = 200, completion: @escaping ((Result<BookList, Error>) -> Void), retryAttempts: Int = 0) {
		
		let headers = [
			"Content-Type": "application/json",
			"Authorization": "Bearer \(token)"
		]

		let targetUrl = "/books?page=\(page)&per=\(perPage)"

		self.get(targetUrl: targetUrl,
				 requestHeaders: headers,
				 completionHandler: completion,
				 retryAttempts: retryAttempts)
	}

}

