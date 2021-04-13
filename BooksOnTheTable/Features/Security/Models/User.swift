//
//  User.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 10/04/21.
//

import Foundation

struct User: Codable {
	
	let name: String
	let email: String
	let password: String?

	init(name: String, email: String, password: String?) {
		self.name = name
		self.email = email
		self.password = password
	}
	
	init(from credential: LoginCredential) {
		self.name = ""
		self.email = credential.login
		self.password = credential.password
	}
	
}
