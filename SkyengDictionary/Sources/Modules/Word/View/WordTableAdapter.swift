//
//  WordTableAdapter.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

import UIKit

final class WordTableAdapter: NSObject {
	private var tableView: UITableView?
	private var items: [WordItemViewModel] = []

	func connect(tableView: UITableView) {
		self.tableView = tableView
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(WordItemCell.self, forCellReuseIdentifier: WordItemCell.identifier)
	}

	func update(items: [WordItemViewModel]) {
		self.items = items
		tableView?.reloadData()
	}

	func clear() {
		self.items.removeAll()
		tableView?.reloadData()
	}
}

extension WordTableAdapter: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: WordItemCell.identifier, for: indexPath) as? WordItemCell else {
			fatalError("Wrong cell type")
		}
		cell.update(viewModel: items[indexPath.row])
		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		UITableView.automaticDimension
	}
}
