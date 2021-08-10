//
//  MainCoordinator.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
	let window: UIWindow

	init(window: UIWindow) {
		self.window = window
		super.init()
	}

	override func start() {
		let navigationController = UINavigationController()
		let searchWordCoordinator = SearchWordCoordinator(navigationController: navigationController)

		self.store(coordinator: searchWordCoordinator)
		searchWordCoordinator.start()

		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}
}
