//
//  NetworkClientMock.swift
//  SkyengDictionaryTests
//
//  Created by Elizaveta Semyonova on 10.08.2021.
//

import XCTest
@testable import SkyengDictionary

final class NetworkRequestMock: NetworkRequestProtocol {
	var cancelCalled: Bool?
	func cancel() {
		self.cancelCalled = true
	}
}

final class NetworkClientMock: NetworkClientProtocol {

	var expectedResult: Result<Data?, Error>?
	var expectation: XCTestExpectation?

	func load(route: NetworkRoute, completion: @escaping (Result<Data?, Error>) -> Void) -> NetworkRequestProtocol? {
		guard let expectedResult = expectedResult else {
			completion(.failure(NSError.unknown))
			expectation?.fulfill()
			return nil
		}

		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			completion(expectedResult)
			self.expectation?.fulfill()
		}
		return NetworkRequestMock()
	}
}
