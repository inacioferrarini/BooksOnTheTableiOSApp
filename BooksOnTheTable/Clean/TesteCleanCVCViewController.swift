//
//  TesteCleanCVCViewController.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 07/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol TesteCleanCVCDisplayLogic: class {
	func display(viewModel: TesteCleanCVC.UseCase.ViewModel)
	func display(error: Error)
}

class TesteCleanCVCViewController: UIViewController {

	// MARK: - Properties

	var interactor: TesteCleanCVCBusinessLogic?
	var router: (TesteCleanCVCRoutingLogic & TesteCleanCVCDataPassing)?
	var delegate: TesteCleanCVCCollectionViewDelegateProtocol?
	var dataSource: TesteCleanCVCCollectionViewDataSourceProtocol?

	// MARK: - Outlets

	@IBOutlet weak var collectionView: UICollectionView!

	// MARK: - Init

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		setup()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}

	// MARK: - Overrides

	override func viewDidLoad() {
		super.viewDidLoad()
		setupCollectionView()
		doSomething()
	}

 	// MARK: - Actions
 
    // @IBAction func ...

	// MARK: - Private Methods

	private func setup() {
		let viewController = self
		let sceneNavigator = viewController.navigationController
		let presenter = TesteCleanCVCPresenter(viewController: viewController)
		let interactor = TesteCleanCVCInteractor(presenter: presenter)
		let router = TesteCleanCVCRouter(dataStore: interactor, sceneNavigator: sceneNavigator)
		viewController.interactor = interactor
		viewController.router = router
	}

	private func setupCollectionView() {
		guard let collectionView = collectionView else { return }

		let bundle = Bundle(for: type(of: self))
		let cellType = String(describing: TesteCleanCVCCollectionViewCell.self)
        collectionView.register(UINib(nibName: cellType, bundle: bundle), forCellWithReuseIdentifier: cellType)

		let dataSource = TesteCleanCVCCollectionViewDataSource()
		let delegate = TesteCleanCVCCollectionViewDelegate(dataSource: dataSource)

		delegate.onItemSelected = { (displayData: TesteCleanCVC.UseCase.ViewModel.DisplayData) in
			debugPrint("Item Selected: \(displayData.title)")
		}

		self.dataSource = dataSource
		collectionView.dataSource = dataSource

		self.delegate = delegate
        collectionView.delegate = delegate
	}

}

extension TesteCleanCVCViewController: TesteCleanCVCDisplayLogic {

	func doSomething() {
		let request = TesteCleanCVC.UseCase.Request()
		interactor?.doSomething(request: request)
	}

	func display(viewModel: TesteCleanCVC.UseCase.ViewModel) {
		dataSource?.items = viewModel.displayDataList
		collectionView.reloadData()
	}

	func display(error: Error)	{
		let alert = UIAlertController(
			title: title,
			message: String(describing: error),
			preferredStyle: .alert
		)
		let okAction = UIAlertAction(
			title: "OK",
			style: .default
		)
		alert.addAction(okAction)
		present(alert, animated: true, completion: nil)
	}

}