//
//  TesteCleanCVCInteractor.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 07/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - Protocols

protocol TesteCleanCVCBusinessLogic {
	func doSomething(request: TesteCleanCVC.UseCase.Request)
}

protocol TesteCleanCVCDataStore {
	//var property: String { get set }
}

class TesteCleanCVCInteractor: TesteCleanCVCDataStore {

	// MARK: - Properties

	let presenter: TesteCleanCVCPresentationLogic
	let worker: TesteCleanCVCWorkerProtocol
	//var property: String = ""

	// MARK: - Init

	init(
		presenter: TesteCleanCVCPresentationLogic,
		worker: TesteCleanCVCWorkerProtocol = TesteCleanCVCWorker()
	) {
		self.presenter = presenter
		self.worker = worker
	}

}

extension TesteCleanCVCInteractor: TesteCleanCVCBusinessLogic {

	func doSomething(request: TesteCleanCVC.UseCase.Request) {
		DispatchQueue.global().async { [weak self] in
			self?.worker.doWork(completion: { [weak self] (result: TesteCleanCVCWorkerResult<[TesteCleanCVCData]>) in
				switch result {
				case .success(let values):
					let response = TesteCleanCVC.UseCase.Response(dataList: values)
					self?.presenter.present(response: response)
				case .failure(let error):
					self?.presenter.present(error: error)
				}
			})
		}
	}

}
