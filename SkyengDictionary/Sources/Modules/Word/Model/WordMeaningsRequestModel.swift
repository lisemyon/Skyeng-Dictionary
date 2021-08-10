//
//  WordMeaningsRequestModel.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

struct WordMeaningsRequestModel: Encodable {
	let ids: String

	init(indices: [Int]) {
		self.ids = indices.map { "\($0)" } .joined(separator: ",")
	}
}
