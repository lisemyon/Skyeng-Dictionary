//
//  WordPresenter.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 07.08.2021.
//

import Foundation

protocol WordPresentable {
	func initialState()
}

final class WordPresenter: WordPresentable {
	weak var viewController: WordDisplayLogic?

	private let model: WordModel
	private let networkClient: NetworkClientProtocol
	private let parameters: ParametersProviderProtocol

	init(
		model: WordModel,
		networkClient: NetworkClientProtocol = NetworkClient(),
		parameters: ParametersProviderProtocol = ParametersProvider()
	) {
		self.model = model
		self.networkClient = networkClient
		self.parameters = parameters
	}

	func initialState() {
		loadData()
		viewController?.display(title: model.text)
	}
}

private extension WordPresenter {
	func loadData() {
		let request = WordMeaningsRequestModel(indices: model.meanings.map { $0.id })
		let route = NetworkRoute(path: .meanings, parameters: request)

		networkClient.load(route: route) { [weak self] result in
			guard let self = self else { return }

			switch result {
			case .success(let data):
				if let items = data?.map(type: [WordFullMeaningModel].self) {
					self.viewController?.display(meanings: self.prepareData(items: items))
				}
				else {
					self.viewController?.display(error: NSError.unknown.localizedDescription)
				}
			case .failure(let error):
				self.viewController?.display(error: error.localizedDescription)
			}
		}
	}

	func prepareData(items: [WordFullMeaningModel]) -> [WordItemViewModel] {
		let https: String = self.parameters.getValue(key: .https)

		return items.map { model in
			var imageUrl: URL?
			if let url = model.images.first?.url {
				imageUrl = URL(string: https + url)
			}
			let definition = Texts.Word.definition.text(model.definition.text)
			let translation = Texts.Word.translation.text(model.translation.text)
			return WordItemViewModel(translation: translation, definition: definition, imageUrl: imageUrl)
		}
	}
}
