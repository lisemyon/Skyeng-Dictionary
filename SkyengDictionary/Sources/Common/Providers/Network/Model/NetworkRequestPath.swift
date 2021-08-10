//
//  NetworkRequestPath.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 08.08.2021.
//

import Foundation

enum NetworkRequestPath: String {

	var urlPath: String { rawValue }

	// GET
	case meanings = "/api/public/v1/meanings"
	// GET
	case search = "/api/public/v1/words/search"
}
