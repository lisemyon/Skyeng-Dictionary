//
//  NetworkRoute.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 08.08.2021.
//

import Foundation

// Умеет работать только с GET методами так как других не заявлено
struct NetworkRoute {

	private let path: NetworkRequestPath
	private let parameters: Encodable

	init(path: NetworkRequestPath, parameters: Encodable) {
		self.path = path
		self.parameters = parameters
	}

	func makeRequest(baseUrl: String) -> URLRequest? {
		guard var components = URLComponents(string: baseUrl + path.urlPath) else { return nil }

		components.queryItems = parameters.jsonDict?.compactMap { (key, value) in
			URLQueryItem(name: key, value: "\(value)")
		}

		guard let url = components.url else { return nil }
		return URLRequest(url: url)
	}
}
