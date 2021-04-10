//
//  TesteCleanCVCCollectionViewDataSource.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 07/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol TesteCleanCVCCollectionViewDataSourceProtocol: UICollectionViewDataSource {	
	var items: [TesteCleanCVC.UseCase.ViewModel.DisplayData] { get set }
}

class TesteCleanCVCCollectionViewDataSource: NSObject, TesteCleanCVCCollectionViewDataSourceProtocol {

	// MARK: - Properties

	var items: [TesteCleanCVC.UseCase.ViewModel.DisplayData] = []

	// MARK: - Overrides
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return items.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TesteCleanCVCCollectionViewCell", for: indexPath)

		if let cell = cell as? TesteCleanCVCCollectionViewCell, indexPath.row < self.items.count {
			let itemObject = self.items[indexPath.item]
			cell.setup(with: itemObject)
		}

		return cell
	}
	
}
