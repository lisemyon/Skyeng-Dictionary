//
//  EncodableExtension.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 08.08.2021.
//

import Foundation

extension Encodable {
	var jsonDict: [String: Any]? {
		guard
			let data = try? JSONEncoder().encode(self),
			let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
			return nil
		}
		return dictionary
	}
}
