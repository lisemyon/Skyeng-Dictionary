//
//  WordView.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 07.08.2021.
//

import UIKit

final class WordView: BaseView {
	private(set) var tableView: UITableView = {
		let view = UITableView()
		view.tableFooterView = UIView()
		return view
	}()

	override func addSubviews() {
		super.addSubviews()
		addSubview(tableView)
	}

	override func makeConstraints() {
		super.makeConstraints()
		tableView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}
	}

	override func setup() {
		super.setup()
		backgroundColor = .systemBackground
	}
}
