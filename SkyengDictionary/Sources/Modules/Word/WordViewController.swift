//
//  WordViewController.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 07.08.2021.
//

import UIKit

protocol WordDisplayLogic: AnyObject {
	func display(meanings: [WordItemViewModel])
	func display(error: String)
	func display(title: String)
}

final class WordViewController: UIViewController {
	private let presenter: WordPresentable
	private let customView: WordView = WordView(frame: UIScreen.main.bounds)
	private let adapter = WordTableAdapter()

	init(presenter: WordPresentable) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		self.view = customView
		adapter.connect(tableView: customView.tableView)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.initialState()
	}
}

extension WordViewController: WordDisplayLogic {
	func display(meanings: [WordItemViewModel]) {
		adapter.update(items: meanings)
	}

	func display(title: String) {
		self.title = title
	}

	func display(error: String) {
		let alert = UIAlertController(title: Texts.Error.title.text, message: error, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: Texts.Error.gotIt.text, style: .default, handler: nil))
		present(alert, animated: true, completion: nil)
	}
}
