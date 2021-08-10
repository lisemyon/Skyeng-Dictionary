//
//  WordModel.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 08.08.2021.
//

import Foundation

struct WordModel: Decodable {
	let id: Int
	let text: String
	let meanings: [WordMeaningModel]
}
