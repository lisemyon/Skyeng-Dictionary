//
//  SearchWordDisplayLogicMock.swift
//  SkyengDictionaryTests
//
//  Created by Elizaveta Semyonova on 10.08.2021.
//

@testable import SkyengDictionary

final class SearchWordDisplayLogicMock: SearchWordDisplayLogic {
	var progress: Bool?
	func display(progress: Bool) {
		self.progress = progress
	}

	var error: String?
	func display(error: String) {
		self.error = error
	}

	var words: [SearchWordItemViewModel]?
	func display(words: [SearchWordItemViewModel]) {
		self.words = words
	}

	var isEmptyHidden: Bool?
	func displayEmpty(isHidden: Bool) {
		self.isEmptyHidden = isHidden
	}
}
