//
//  SearchWordPresenter.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 07.08.2021.
//

import Foundation

protocol SearchWordPresentable {
	func initialState()
	func search(text: String)
	func select(wordId: Int)
}

private enum Constants {
	static let searchDelay = 0.5
	static let searchTextMinCount = 2
}

final class SearchWordPresenter: SearchWordPresentable {
	weak var viewController: SearchWordDisplayLogic?
	weak var output: SearchWordCoordinatorDelegate?

	private let networkClient: NetworkClientProtocol

	private var workItem: DispatchWorkItem?
	private var request: NetworkRequestProtocol?
	private var items: [WordModel] = []

	init(networkClient: NetworkClientProtocol = NetworkClient()) {
		self.networkClient = networkClient
	}

	func initialState() {
		viewController?.displayEmpty(isHidden: false)
	}

	func search(text: String) {
		self.clear()

		guard text.count >= Constants.searchTextMinCount else {
			viewController?.displayEmpty(isHidden: false)
			return
		}

		let workItem = DispatchWorkItem { [weak self] in
			self?.sendRequest(model: SearchWordRequestModel(search: text))
		}

		DispatchQueue.main.asyncAfter(deadline: .now() + Constants.searchDelay, execute: workItem)
		self.workItem = workItem
	}

	func select(wordId: Int) {
		output?.openMeanings(parameters: WordParameters(model: items[wordId]))
	}
}

private extension SearchWordPresenter {
	func sendRequest(model: SearchWordRequestModel) {
		let route = NetworkRoute(path: .search, parameters: model)

		viewController?.display(progress: true)
		request = networkClient.load(route: route) { [weak self] result in
			guard let self = self else { return }

			switch result {
			case .success(let data):
				if let items = data?.map(type: [WordModel].self) {
					self.items = items
					self.configure(items: items)
				}
				else {
					self.viewController?.display(error: NSError.unknown.localizedDescription)
				}
			case .failure(let error):
				self.viewController?.display(error: error.localizedDescription)
			}

			self.viewController?.display(progress: false)
		}
	}

	func configure(items: [WordModel]) {
		if items.isEmpty {
			viewController?.displayEmpty(isHidden: false)
		}
		else {
			viewController?.displayEmpty(isHidden: true)
			viewController?.display(words: items.map { SearchWordItemViewModel(model: $0) })
		}
	}

	func clear() {
		self.workItem?.cancel()
		self.request?.cancel()
		self.items.removeAll()
	}
}
