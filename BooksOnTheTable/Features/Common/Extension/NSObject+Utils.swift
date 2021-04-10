//
//  NSObject+Utils.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 08/04/21.
//

import Foundation

extension NSObject {
	
	open class func simpleClassName() -> String {
		guard let className = object_getClass(self) else { return "" }
		let fullClassName: String = NSStringFromClass(className)
		let classNameComponents = fullClassName.split {$0 == "."}.map(String.init)
		return classNameComponents.last!
	}
	
}
