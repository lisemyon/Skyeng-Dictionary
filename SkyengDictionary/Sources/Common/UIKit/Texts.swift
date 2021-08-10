//
//  Texts.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

import Foundation

protocol Localizable {
	var rawValue: String { get }
	var text: String { get }
	func text(_ args: String...) -> String
}

extension Localizable {
	var text: String { rawValue }
	func text(_ args: String...) -> String {
		String(format: rawValue, arguments: args)
	}
}

enum Texts {
	enum Error: String, Localizable {
		case title = "Ошибка"
		case gotIt = "Понятно"
	}

	enum SearchWord: String, Localizable {
		case title = "Skyeng словарь"
		case searchPlaceholder = "Введите слово"

		enum Empty: String, Localizable {
			case title = "Пока ничего нет"
			case description = "Здесь появятся результаты поиска как только вы введете какое-нибудь слово"
		}
	}

	enum Word: String, Localizable {
		case translation = "Перевод: %@"
		case definition = "Описание: %@"
	}
}
