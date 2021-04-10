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
		let dateFormat = DateFormatter()
		dateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		token = try values.decode(String.self, forKey: .token)
		
		guard let creationDateString = try? values.decode(String.self, forKey: .creationDate),
			  let parsedCreationDate = dateFormat.date(from: creationDateString)
		else { throw Errors.creationDateDecodingError }
		creationDate = parsedCreationDate
		
		guard let expirationDateString = try? values.decode(String.self, forKey: .expirationDate),
			  let parsedExpirationDate = dateFormat.date(from: expirationDateString)
		else { throw Errors.expirationDateDecodingError }
		expirationDate = parsedExpirationDate
	}

}
