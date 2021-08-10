//
//  NetworkRequestProtocol.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 10.08.2021.
//

import Foundation

protocol NetworkRequestProtocol {
	func cancel()
}

extension URLSessionDataTask: NetworkRequestProtocol { }
