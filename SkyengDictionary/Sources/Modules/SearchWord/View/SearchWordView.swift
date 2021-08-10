//
//  SearchWordView.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 07.08.2021.
//

import UIKit
import SnapKit

final class SearchWordView: BaseView {

	private(set) var searchBar: UISearchBar = {
		let view = UISearchBar()
		view.placeholder = Texts.SearchWord.searchPlaceholder.text
		return view
	}()

	private(set) var tableView: UITableView = {
		let view = UITableView()
		view.tableFooterView = UIView()
		return view
	}()

	private let emptyView = SearchWordEmptyView()
	private let progressView = UIActivityIndicatorView()

	override func addSubviews() {
		super.addSubviews()
		addSubview(tableView)
		addSubview(progressView)
	}

	override func makeConstraints() {
		super.makeConstraints()
		tableView.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.leading.trailing.bottom.equalToSuperview()
		}

		progressView.snp.makeConstraints { make in
			make.center.equalToSuperview()
		}
	}

	override func setup() {
		super.setup()
		backgroundColor = .systemBackground
		progressView.hidesWhenStopped = true
	}

	func setupEmptyView(hidden: Bool) {
		guard !hidden else {
			emptyView.removeFromSuperview()
			return
		}

		guard emptyView.superview == nil else { return }

		addSubview(emptyView)
		emptyView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}
	}

	func setupActivityIndicator(hidden: Bool) {
		hidden ? progressView.stopAnimating() : progressView.startAnimating()
	}
}
