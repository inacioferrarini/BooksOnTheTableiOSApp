//
//  Token.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 10/04/21.
//

import Foundation

struct Token: Codable {
	let token: String
	let creationDate: Date
	let expirationDate: Date
	
	var isValid: Bool {
		return expirationDate >= Date()
	}
}

enum Errors: Error {
	case creationDateDecodingError
	case expirationDateDecodingError
}

extension Token {

	enum CodingKeys: String, CodingKey {
		case token
		case creationDate = "createdAt"
		case expirationDate = "expiresAt"
	}

	init(from decoder: Decoder) throws {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		token = try values.decode(String.self, forKey: .token)
				
		guard let creationDateString = try? values.decode(String.self, forKey: .creationDate),
			  let parsedCreationDate = dateFormatter.date(from: creationDateString)
		else { throw Errors.creationDateDecodingError }
		creationDate = parsedCreationDate

		guard let expirationDateString = try? values.decode(String.self, forKey: .expirationDate),
			  let parsedExpirationDate = dateFormatter.date(from: expirationDateString)
		else { throw Errors.expirationDateDecodingError }
		expirationDate = parsedExpirationDate
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(token, forKey: .token)
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"

		let creationDateString = dateFormatter.string(from: creationDate)
		try container.encode(creationDateString, forKey: .creationDate)
		
		let expirationDateString = dateFormatter.string(from: expirationDate)
		try container.encode(expirationDateString, forKey: .expirationDate)
	}
	
}
