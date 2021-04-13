//
//  LoginSceneDelegate.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 13/04/21.
//

import Foundation

// MARK: - Protocols

protocol LoginSceneDelegate: class {
	func loginScene(_ loginScene: LoginViewController, didAuthenticateWith token: Token)
}
