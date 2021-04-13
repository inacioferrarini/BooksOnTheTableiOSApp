//
//  LoginModels.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 13/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

enum Login {

	enum Login {
		
		struct Request {
			let user: User
		}
		
		struct Response {
			let token: Token
		}
	
		struct ViewModel {
			let token: Token
		}
		
	}
	
}
