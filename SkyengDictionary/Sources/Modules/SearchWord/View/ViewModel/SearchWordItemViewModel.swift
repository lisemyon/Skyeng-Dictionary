//
//  SearchWordItemViewModel.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

import Foundation

struct SearchWordItemViewModel {
	let text: String

	init(model: WordModel) {
		self.text = model.text
	}
}
