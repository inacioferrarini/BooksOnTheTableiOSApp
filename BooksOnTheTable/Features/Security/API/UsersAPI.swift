//
//  UserAPI.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 10/04/21.
//

import Foundation
import Awe

protocol UserAPIProtocol {
	func create(user: User, completion: @escaping ((Result<User, Error>) -> Void))
}

class UsersAPI: UserAPIProtocol {
	
	// MARK: - Properties
	
	private let api: API
	
	// MARK: - Init
	
	init(rootUrl: String = SecurityConstants.kSecurityApiUrl) {
		self.api = API(rootUrl)
	}

	// MARK: - Create
	
	func create(user: User, completion: @escaping ((Result<User, Error>) -> Void)) {
		
		let targetUrl = "/users"
		
		api.post(targetUrl: targetUrl,
				 requestObject: user,
				 requestHeaders: headers(),
				 completionHandler: completion,
				 retryAttempts: 0
		)
	}
	
	// MARK: - Private Methods
	
	private func headers() -> [String: String] {
		return [
			"Content-Type": "application/json",
		]
	}

}
