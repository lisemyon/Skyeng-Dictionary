//
//  WordFullMeaningModel.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

import Foundation

struct WordFullMeaningModel: Decodable {
	let id: String
	let wordId: Int
	let difficultyLevel: Int?
	let partOfSpeechCode: PartOfSpeechCode
	let translation: TranslationModel
	let images: [WordImageModel]
	let transcription: String
	let text: String
	let definition: DefinitionModel
}
