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
}
