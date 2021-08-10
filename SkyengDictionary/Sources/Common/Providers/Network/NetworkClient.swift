//
//  NetworkClinet.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 07.08.2021.
//

import Foundation

protocol NetworkClientProtocol {
	@discardableResult
	func load(route: NetworkRoute, completion: @escaping (Result<Data?, Error>) -> Void) -> NetworkRequestProtocol?
}

final class NetworkClient: NetworkClientProtocol {

	private let parameters: ParametersProviderProtocol

	private var baseUrl: String {
		parameters.getValue(key: .networkBaseUrl)
	}

	init(parameters: ParametersProviderProtocol = ParametersProvider()) {
		self.parameters = parameters
	}

	@discardableResult
	func load(route: NetworkRoute, completion: @escaping (Result<Data?, Error>) -> Void) -> NetworkRequestProtocol? {
		guard let request = route.makeRequest(baseUrl: baseUrl) else {
			completion(.failure(NSError.unknown))
			return nil
		}
		let task = URLSession.shared.dataTask(with: request) { data, _, error in
			DispatchQueue.main.async {
				if let error = error {
					completion(.failure(error))
				}
				else {
					completion(.success(data))
				}
			}
		}
		task.resume()
		return task
	}
}
