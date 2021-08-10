//
//  WordCoordinator.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

import UIKit

struct WordParameters {
	let model: WordModel
}

final class WordCoordinator: BaseCoordinator {

	private let parameters: WordParameters
	private let navigationController: UINavigationController

	private weak var viewController: UIViewController?

	init(
		navigationController: UINavigationController,
		parameters: WordParameters
	) {
		self.navigationController = navigationController
		self.parameters = parameters
	}

	override func start() {
		let presenter = WordPresenter(model: parameters.model)
		let viewController = WordViewController(presenter: presenter)
		presenter.viewController = viewController
		self.viewController = viewController

		navigationController.pushViewController(viewController, animated: true)
		navigationController.delegate = self
	}
}

extension WordCoordinator: UINavigationControllerDelegate {
	func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
		guard viewController != self.viewController else { return }
		free(coordinator: self)
	}
}
