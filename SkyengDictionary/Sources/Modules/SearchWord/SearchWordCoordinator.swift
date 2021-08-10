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
	private weak var viewController: UIViewController?

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	override func start() {
		let presenter = SearchWordPresenter()
		let viewController = SearchWordViewController(presenter: presenter)
		presenter.viewController = viewController
		presenter.output = self
		self.viewController = viewController

		navigationController.pushViewController(viewController, animated: true)
		navigationController.delegate = self
	}
}

extension SearchWordCoordinator: SearchWordCoordinatorDelegate {
	func openMeanings(parameters: WordParameters) {
		let coordinator = WordCoordinator(navigationController: navigationController, parameters: parameters)
		self.store(coordinator: coordinator)
		coordinator.start()
	}
}

extension SearchWordCoordinator: UINavigationControllerDelegate {
	func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
		guard viewController == self.viewController else { return }
		childCoordinators.removeAll()
	}
}
