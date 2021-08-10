//
//  SearchWordCoordinator.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

import UIKit

protocol SearchWordCoordinatorDelegate: AnyObject {
	func openMeanings(parameters: WordParameters)
}

final class SearchWordCoordinator: BaseCoordinator {

	private let navigationController: UINavigationController

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	override func start() {
		let presenter = SearchWordPresenter()
		let viewController = SearchWordViewController(presenter: presenter)
		presenter.viewController = viewController
		presenter.output = self

		navigationController.pushViewController(viewController, animated: true)
	}
}

extension SearchWordCoordinator: SearchWordCoordinatorDelegate {
	func openMeanings(parameters: WordParameters) {
		let coordinator = WordCoordinator(navigationController: navigationController, parameters: parameters)
		self.store(coordinator: coordinator)
		coordinator.start()
	}
}
