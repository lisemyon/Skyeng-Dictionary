//
//  SearchWordTableAdapter.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 08.08.2021.
//

import UIKit

protocol SearchWordTableAdapterDelegate: AnyObject {
	func selected(id: Int)
}

final class SearchWordTableAdapter: NSObject {
	weak var delegate: SearchWordTableAdapterDelegate?

	private var tableView: UITableView?
	private var items: [SearchWordItemViewModel] = []

	func connect(tableView: UITableView) {
		self.tableView = tableView
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(SearchWordViewItemCell.self, forCellReuseIdentifier: SearchWordViewItemCell.identifier)
	}

	func update(items: [SearchWordItemViewModel]) {
		self.items = items
		tableView?.reloadData()
	}

	func clear() {
		self.items.removeAll()
		tableView?.reloadData()
	}
}

extension SearchWordTableAdapter: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchWordViewItemCell.identifier, for: indexPath) as? SearchWordViewItemCell else {
			fatalError("Wrong cell type")
		}
		cell.update(viewModel: items[indexPath.row])
		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		UITableView.automaticDimension
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		delegate?.selected(id: indexPath.row)
	}
}
