//
//  BaseCoordinator.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

import Foundation

class BaseCoordinator: NSObject, Coordinator {
	var childCoordinators: [Coordinator] = []

	func start() {
		fatalError("Children should implement `start`.")
	}

	func store(coordinator: Coordinator) {
		childCoordinators.append(coordinator)
	}

	func free(coordinator: Coordinator) {
		childCoordinators = childCoordinators.filter { $0 !== coordinator }
	}
}
