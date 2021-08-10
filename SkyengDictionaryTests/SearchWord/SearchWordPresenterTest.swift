//
//  SearchWordPresenterTest.swift
//  SkyengDictionaryTests
//
//  Created by Elizaveta Semyonova on 10.08.2021.
//

import XCTest
@testable import SkyengDictionary

class SearchWordPresenterTest: XCTestCase {

	// Проверка начального empty состояния
	func testInitialState() {
		let presenter = SearchWordPresenter()
		let displayMock = SearchWordDisplayLogicMock()
		presenter.viewController = displayMock
		presenter.initialState()
		XCTAssertEqual(displayMock.isEmptyHidden, false)
	}

	// Проверка отсутствия поиска при вводе одного символа
	func testSearchOneSymbol() {
		let presenter = SearchWordPresenter()
		let displayMock = SearchWordDisplayLogicMock()
		presenter.viewController = displayMock
		presenter.search(text: TestData.symbol)
		XCTAssertNil(displayMock.words)
	}

	func testLoadData() {
		// NetworkClient setup
		let networkMock = NetworkClientMock()
		let expectation = expectation(description: "Request expectation")
		networkMock.expectedResult = .success(TestData.seaAnswer.data(using: .utf8))
		networkMock.expectation = expectation
		// Presenter init
		let presenter = SearchWordPresenter(networkClient: networkMock)
		let displayMock = SearchWordDisplayLogicMock()
		// Testing request
		presenter.viewController = displayMock
		presenter.search(text: TestData.sea)
		waitForExpectations(timeout: 5) { _ in
			XCTAssertGreaterThan(displayMock.words?.count ?? .zero, Int.zero)
		}
	}

	func testErrorLoadData() {
		// NetworkClient setup
		let networkMock = NetworkClientMock()
		let expectation = expectation(description: "Request expectation")
		networkMock.expectedResult = .failure(NSError.unknown)
		networkMock.expectation = expectation
		// Presenter init
		let presenter = SearchWordPresenter(networkClient: networkMock)
		let displayMock = SearchWordDisplayLogicMock()
		// Testing request
		presenter.viewController = displayMock
		presenter.search(text: TestData.sea)
		waitForExpectations(timeout: 5) { error in
			XCTAssertNil(displayMock.words)
			XCTAssertNotNil(displayMock.error)
		}
	}
}
//swiftlint:disable type_body_length
private struct TestData {
	static let symbol = "s"
	static let sea = "sea"
	static let seaAnswer = """
		[
		  {
			"id": 875,
			"text": "sea",
			"meanings": [
			  {
				"id": 33273,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "море",
				  "note": null
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/c1f7b84ee65410e732685005650b94f1.jpeg?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/c1f7b84ee65410e732685005650b94f1.jpeg?w=640&h=480",
				"transcription": "siː",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=sea"
			  },
			  {
				"id": 33274,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "огромное множество",
				  "note": null
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/006da8426f8ed38aff24cfb02a92893c.jpeg?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/006da8426f8ed38aff24cfb02a92893c.jpeg?w=640&h=480",
				"transcription": "siː",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=sea"
			  }
			]
		  },
		  {
			"id": 54453,
			"text": "sea tang",
			"meanings": [
			  {
				"id": 60475,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "водоросль",
				  "note": ""
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/b9afb27ec85e82cc55edf7c3c499228d.jpeg?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/b9afb27ec85e82cc55edf7c3c499228d.jpeg?w=640&h=480",
				"transcription": "siː tæŋ",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=sea+tang"
			  }
			]
		  },
		  {
			"id": 84935,
			"text": "sea chantey",
			"meanings": [
			  {
				"id": 132114,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "морские песни шанти",
				  "note": null
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/752d10c831de7df77efc7efe31d32582.jpeg?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/752d10c831de7df77efc7efe31d32582.jpeg?w=640&h=480",
				"transcription": "siː ˈʧɑːnti",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=sea+chantey"
			  }
			]
		  },
		  {
			"id": 72745,
			"text": "sea-rocket",
			"meanings": [
			  {
				"id": 76164,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "тагшта",
				  "note": null
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/50eee63f8df0517aa4a2c26a223b83e5.jpeg?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/50eee63f8df0517aa4a2c26a223b83e5.jpeg?w=640&h=480",
				"transcription": "siː ˈrɒkɪt",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=sea-rocket"
			  }
			]
		  },
		  {
			"id": 57525,
			"text": "dead sea",
			"meanings": [
			  {
				"id": 23069,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "Мёртвое море",
				  "note": ""
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/4cf7fe993ca786728e61a2377d43a31d.jpeg?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/4cf7fe993ca786728e61a2377d43a31d.jpeg?w=640&h=480",
				"transcription": "dɛd siː",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=dead+sea"
			  }
			]
		  },
		  {
			"id": 71268,
			"text": "sea robber",
			"meanings": [
			  {
				"id": 26659,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "морской разбойник",
				  "note": ""
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/3667fc0e1298e84da606452875bbb44b.jpeg?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/3667fc0e1298e84da606452875bbb44b.jpeg?w=640&h=480",
				"transcription": "siː ˈrɒbə",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=sea+robber"
			  }
			]
		  },
		  {
			"id": 80427,
			"text": "sea bathing",
			"meanings": [
			  {
				"id": 8474,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "купание в море",
				  "note": ""
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/ae46053b027848e58b00d5c19e87643f.jpeg?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/ae46053b027848e58b00d5c19e87643f.jpeg?w=640&h=480",
				"transcription": "siː ˈbeɪðɪŋ",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=sea+bathing"
			  }
			]
		  },
		  {
			"id": 53294,
			"text": "sea puss",
			"meanings": [
			  {
				"id": 13620,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "глубинное течение вдоль берега",
				  "note": ""
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/57e533270735bb48bfe06e1e1964ac34.jpeg?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/57e533270735bb48bfe06e1e1964ac34.jpeg?w=640&h=480",
				"transcription": "siː pʊs",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=sea+puss"
			  }
			]
		  },
		  {
			"id": 49486,
			"text": "sea cow",
			"meanings": [
			  {
				"id": 99336,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "ламантин",
				  "note": ""
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/083dcfa89e9985931325cf032aa2153d.jpeg?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/083dcfa89e9985931325cf032aa2153d.jpeg?w=640&h=480",
				"transcription": "siː kaʊ",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=sea+cow"
			  }
			]
		  },
		  {
			"id": 66267,
			"text": "sea rover",
			"meanings": [
			  {
				"id": 134774,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "пират",
				  "note": null
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/3667fc0e1298e84da606452875bbb44b.jpeg?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/3667fc0e1298e84da606452875bbb44b.jpeg?w=640&h=480",
				"transcription": "siː ˈrəʊvə",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=sea+rover"
			  }
			]
		  },
		  {
			"id": 105702,
			"text": "norwegian sea",
			"meanings": [
			  {
				"id": 188508,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "Норвежское море",
				  "note": ""
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/a3691a7fddc9ea038a23bcb1abd430c2.png?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/a3691a7fddc9ea038a23bcb1abd430c2.png?w=640&h=480",
				"transcription": "nɔːˈwiːʤən siː",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=norwegian+sea"
			  }
			]
		  },
		  {
			"id": 69303,
			"text": "Irish Sea",
			"meanings": [
			  {
				"id": 207407,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "Ирландское море",
				  "note": ""
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/31e3b5478e7346cae9db8225e6f311a9.png?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/31e3b5478e7346cae9db8225e6f311a9.png?w=640&h=480",
				"transcription": "ˈaɪərɪʃ siː",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=Irish+Sea"
			  }
			]
		  },
		  {
			"id": 60253,
			"text": "sea gull",
			"meanings": [
			  {
				"id": 215783,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "чайка",
				  "note": ""
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/444649f6fd6d5255ecb14c0a601a708b.jpeg?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/444649f6fd6d5255ecb14c0a601a708b.jpeg?w=640&h=480",
				"transcription": "siː gʌl",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=sea+gull"
			  }
			]
		  },
		  {
			"id": 57021,
			"text": "sea bass",
			"meanings": [
			  {
				"id": 122562,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "морской окунь",
				  "note": null
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/4d6a85f7deac3cc1ad9f93291e907aac.jpeg?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/4d6a85f7deac3cc1ad9f93291e907aac.jpeg?w=640&h=480",
				"transcription": "siː beɪs",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=sea+bass"
			  },
			  {
				"id": 122561,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "морской окунь",
				  "note": null
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/0090d93bb7e97ea28622f26d5ab4f708.jpeg?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/0090d93bb7e97ea28622f26d5ab4f708.jpeg?w=640&h=480",
				"transcription": "siː bæs",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=sea+bass"
			  }
			]
		  },
		  {
			"id": 52895,
			"text": "head sea",
			"meanings": [
			  {
				"id": 189454,
				"partOfSpeechCode": "n",
				"translation": {
				  "text": "встречная волна",
				  "note": null
				},
				"previewUrl": "//d2zkmv5t5kao9.cloudfront.net/images/72e97c7965669c8a8c04e099280b2d31.jpeg?w=96&h=72",
				"imageUrl": "//d2zkmv5t5kao9.cloudfront.net/images/72e97c7965669c8a8c04e099280b2d31.jpeg?w=640&h=480",
				"transcription": "hɛd siː",
				"soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=head+sea"
			  }
			]
		  }
		]
		"""
}
