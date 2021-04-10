//
//  TesteCleanCVCWorker.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 07/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - Protocols

protocol TesteCleanCVCWorkerProtocol {
	func doWork(completion: @escaping TesteCleanCVCWorkerDoWorkCompletionHandler)
}

// MARK: - Typealiases

typealias TesteCleanCVCWorkerDoWorkCompletionHandler = (TesteCleanCVCWorkerResult<[TesteCleanCVCData]>) -> Void

// MARK: - Enums

enum TesteCleanCVCWorkerResult<U> {
    case success(result: U)
    case failure(error: TesteCleanCVCWorkerError)
}

// MARK: - Errors

enum TesteCleanCVCWorkerError: Equatable, Error {
	case errorKind(String)
}

class TesteCleanCVCWorker: TesteCleanCVCWorkerProtocol {

	// MARK: - Public Methods

	func doWork(completion: @escaping TesteCleanCVCWorkerDoWorkCompletionHandler) {
		
		// succes?
		let dataList = [
			TesteCleanCVCData(name: "Response from TesteCleanCVCWorker Item 1"),
			TesteCleanCVCData(name: "Response from TesteCleanCVCWorker Item 2"),
			TesteCleanCVCData(name: "Response from TesteCleanCVCWorker Item 3")
		]
		completion(.success(result: dataList))

		// failure?
		// completion(.failure(error: .errorKind("")))
	}

}
