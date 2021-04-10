//
//  BookList.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 05/04/21.
//

import Foundation

struct BookList: Codable {
	let bookList: [Book]
}

extension BookList {
	
	enum CodingKeys: String, CodingKey {
		case bookList = "items"
	}
	
}
