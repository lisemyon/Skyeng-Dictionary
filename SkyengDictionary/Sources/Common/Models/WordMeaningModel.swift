//
//  WordMeaningModel.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

import Foundation

struct WordMeaningModel: Decodable {
	let id: Int
	let partOfSpeechCode: PartOfSpeechCode
	let translation: TranslationModel
	let previewUrl: String
	let imageUrl: String
	let transcription: String
	let soundUrl: String
}
