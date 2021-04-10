//
//  TesteCleanCVCCollectionViewDelegate.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 07/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol TesteCleanCVCCollectionViewDelegateProtocol: UICollectionViewDelegate {
	var onItemSelected: ((TesteCleanCVC.UseCase.ViewModel.DisplayData) -> Void)? { get set }
}

class TesteCleanCVCCollectionViewDelegate: NSObject, TesteCleanCVCCollectionViewDelegateProtocol {

	// MARK: - Properties
	
	let dataSource: TesteCleanCVCCollectionViewDataSourceProtocol
	var onItemSelected: ((TesteCleanCVC.UseCase.ViewModel.DisplayData) -> Void)?

	// MARK: - Init

	init(dataSource: TesteCleanCVCCollectionViewDataSourceProtocol) {
		self.dataSource = dataSource
	}

	// MARK: - Overrides

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard indexPath.item < self.dataSource.items.count else { return }
		let selectedItemObject = self.dataSource.items[indexPath.item]
		onItemSelected?(selectedItemObject)
	}

}
