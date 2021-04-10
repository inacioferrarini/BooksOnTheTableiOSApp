//
//  TesteCleanCVCCollectionViewCell.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 07/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol TesteCleanCVCCollectionViewCellProtocol {
	func setup(with value: TesteCleanCVC.UseCase.ViewModel.DisplayData)
}

class TesteCleanCVCCollectionViewCell: UICollectionViewCell, TesteCleanCVCCollectionViewCellProtocol {

	// MARK: - Outlets

	@IBOutlet weak var label: UILabel!

	// MARK: - Public Methods

    func setup(with value: TesteCleanCVC.UseCase.ViewModel.DisplayData) {
        label.text = value.title
    }

}
