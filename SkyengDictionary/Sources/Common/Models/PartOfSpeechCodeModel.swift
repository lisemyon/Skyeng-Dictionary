//
//  PartOfSpeechCodeModel.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

import Foundation

enum PartOfSpeechCode: String, Decodable {
	case noun = "n"
	case verb = "v"
	case adjective = "j"
	case adverb = "r"
	case preposition = "prp"
	case pronoun = "prn"
	case cardinalNumber = "crd"
	case conjunction = "cjc"
	case interjection = "exc"
	case article = "det"
	case abbreviation = "abb"
	case particle = "x"
	case ordinalNumber = "ord"
	case modalVerb = "md"
	case phrase = "ph"
	case idiom = "phi"
}
