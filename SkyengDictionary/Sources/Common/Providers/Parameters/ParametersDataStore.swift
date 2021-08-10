//
//  ParametersDataStore.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 07.08.2021.
//

import Foundation

protocol ParametersDataStoreProtocol {
	func getData() -> [ParametersKey: Any]
}

final class ParametersDataStore: ParametersDataStoreProtocol {
	func getData() -> [ParametersKey: Any] {
		return [
			.networkBaseUrl: "https://dictionary.skyeng.ru",
			.https: "https:"
		]
	}
}
