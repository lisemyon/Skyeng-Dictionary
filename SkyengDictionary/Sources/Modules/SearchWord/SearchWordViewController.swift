//
//  SearchWordViewController.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 07.08.2021.
//

import UIKit

protocol SearchWordDisplayLogic: AnyObject {
	func display(progress: Bool)
	func display(error: String)
	func display(words: [SearchWordItemViewModel])
	func displayEmpty(isHidden: Bool)
}

final class SearchWordViewController: UISearchController {
	private let presenter: SearchWordPresentable
	private let customView = SearchWordView(frame: UIScreen.main.bounds)
	private let adapter = SearchWordTableAdapter()

	init(presenter: SearchWordPresentable) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		self.view = customView
		self.adapter.connect(tableView: customView.tableView)
		self.adapter.delegate = self
		navigationItem.titleView = customView.searchBar
		customView.searchBar.delegate = self
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = Texts.SearchWord.title.text
		presenter.initialState()
	}
}

extension SearchWordViewController: SearchWordDisplayLogic {
	func display(error: String) {
		let alert = UIAlertController(title: Texts.Error.title.text, message: error, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: Texts.Error.gotIt.text, style: .default, handler: nil))
		present(alert, animated: true, completion: nil)
	}

	func display(progress: Bool) {
		customView.setupEmptyView(hidden: !progress)
	}

	func display(words: [SearchWordItemViewModel]) {
		adapter.update(items: words)
	}

	func displayEmpty(isHidden: Bool) {
		if !isHidden {
			adapter.clear()
		}
		customView.setupEmptyView(hidden: isHidden)
	}
}

extension SearchWordViewController: UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		presenter.search(text: searchText)
	}
}

extension SearchWordViewController: SearchWordTableAdapterDelegate {
	func selected(id: Int) {
		presenter.select(wordId: id)
	}
}
