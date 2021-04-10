//
//  TokenAPI.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 10/04/21.
//

import Foundation
import Awe

protocol TokenAPIProtocol {
	
}

class TokenAPI: TokenAPIProtocol {
	
	// MARK: - Properties
	
	private let api: API
	
	// MARK: - Init
	
	init(rootUrl: String = SecurityConstants.kSecurityApiUrl) {
		self.api = API(rootUrl)
	}
	
	// MARK: - Public Methods
	
	func login(user: User, completion: @escaping ((Result<Token, Error>) -> Void)) {
		
		let targetUrl = "/security/token"
		
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
