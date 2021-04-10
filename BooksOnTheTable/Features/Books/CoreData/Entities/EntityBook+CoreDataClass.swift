//
//  EntityBook+CoreDataClass.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 08/04/21.
//
//

import Foundation
import CoreData

@objc(EntityBook)
class EntityBook: NSManagedObject {

	class func removeAll(in context: NSManagedObjectContext) {
		guard let books = self.all(in: context) else { return }
		for book in books {
			context.delete(book)
		}
	}
	
	class func all(in context: NSManagedObjectContext) -> [EntityBook]? {
		return self.allObjects(from: self.fetchRequest(), in: context)
	}
	
	class func fetch(by remoteId: String, in context: NSManagedObjectContext) -> EntityBook? {
		let request: NSFetchRequest = self.fetchRequest()
		request.predicate = NSPredicate(format: "remoteId == %s", remoteId)
		return self.lastObject(from: request, in: context)
	}
	
	@discardableResult
	class func book(book: Book,
					in context: NSManagedObjectContext) -> EntityBook? {
		guard let bookId = book.id else { return nil }
		return EntityBook.book(remotedId: bookId,
						 title: book.title,
						 author: book.authorName,
						 genre: book.genre.rawValue,
						 status: book.status.rawValue,
						 in: context)
	}
	
	@discardableResult
	class func book(
		remotedId: String,
		title: String,
		author: String,
		genre: String,
		status: String,
		in context: NSManagedObjectContext) -> EntityBook? {
		
		let book = self.fetch(by: remotedId, in: context)
		guard book == nil else { return book }
		
		guard let newBook = NSEntityDescription.insertNewObject(
			forEntityName: "Book",
				into: context
		) as? EntityBook else { return nil }
		
		newBook.remoteId = remotedId
		newBook.title = title
		newBook.author = author
		newBook.genre = genre
		newBook.status = status
		
		return newBook
	}
	
}
