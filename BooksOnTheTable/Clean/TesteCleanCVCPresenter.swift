//
//  TesteCleanCVCPresenter.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 07/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - Protocols

protocol TesteCleanCVCPresentationLogic {
	func present(response: TesteCleanCVC.UseCase.Response)
	func present(error: Error)
}

class TesteCleanCVCPresenter: TesteCleanCVCPresentationLogic {

	// MARK: - Properties

	weak var viewController: TesteCleanCVCDisplayLogic?

	// MARK: - Init

	init(viewController: TesteCleanCVCDisplayLogic?) {
		self.viewController = viewController
	}

	// MARK: - Public Methods

	func present(response: TesteCleanCVC.UseCase.Response) {
		var responseData: [TesteCleanCVC.UseCase.ViewModel.DisplayData] = []
		for data in response.dataList {
			let displayData = TesteCleanCVC.UseCase.ViewModel.DisplayData(title: data.name)
			responseData.append(displayData)
		}
		let viewModel = TesteCleanCVC.UseCase.ViewModel(displayDataList: responseData)
		DispatchQueue.main.async { [weak self] in
			self?.viewController?.display(viewModel: viewModel)
		}
	}

	func present(error: Error) {
		DispatchQueue.main.async { [weak self] in
			self?.viewController?.display(error: error)
		}
	}

}
