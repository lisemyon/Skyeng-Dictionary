//
//  DataExtension.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

import Foundation

extension Data {
	func map<T: Decodable>(type: T.Type) -> T? {
		try? JSONDecoder().decode(type, from: self)
	}
}
