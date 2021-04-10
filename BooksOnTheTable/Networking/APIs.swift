//
//  APIs.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 05/04/21.
//

class APIs {

	// MARK: - Init
	
	public init() {}

	// MARK: - Constants
	
	private let apiUrl = "http://localhost:8080"
	
	// MARK: - Properties
	
	lazy var security: SecurityAPI = {
		return SecurityAPI(apiUrl)
	}()
	
	lazy var users: UsersAPI = {
		return UsersAPI(apiUrl)
	}()
	
	lazy var books: BooksAPI = {
		return BooksAPI(apiUrl)
	}()

}

