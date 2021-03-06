//
//  Bok.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 05/04/21.
//

import Foundation

struct Book: Codable {
	
	enum Genre: String, Codable, CaseIterable {
		case horror = "Horror"
	}

	enum Status: String, Codable, CaseIterable {
		case reading = "Reading"
		case done = "Done"
	}
	
	var id: String?
	var title: String
	var authorName: String
	var genre: Genre
	var status: Status
}

extension Book {
	
	enum CodingKeys: String, CodingKey {
		case id
		case title
		case genre
		case status
		case authorName = "author"
	}
	
}
