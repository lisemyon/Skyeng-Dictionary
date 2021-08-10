//
//  ParametersProvider.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 07.08.2021.
//

import Foundation

protocol ParametersProviderProtocol {
	func getValue<T>(key: ParametersKey) -> T
}

final class ParametersProvider: ParametersProviderProtocol {
	private let dataStore: ParametersDataStoreProtocol

	init(dataStore: ParametersDataStoreProtocol = ParametersDataStore()) {
		self.dataStore = dataStore
	}

	func getValue<T>(key: ParametersKey) -> T {
		guard let value = dataStore.getData()[key] as? T else {
			fatalError("You must provide accurate types and not nil values")
		}
		return value
	}
}
