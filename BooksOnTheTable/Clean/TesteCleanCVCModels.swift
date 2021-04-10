//
//  TesteCleanCVCModels.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 07/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

enum TesteCleanCVC {

	enum UseCase {

		struct Request {
		}

		struct Response {
			var dataList: [TesteCleanCVCData]
		}

		struct ViewModel {
			struct DisplayData {
				var title: String
			}

			var displayDataList: [DisplayData]
		}

	}

}
