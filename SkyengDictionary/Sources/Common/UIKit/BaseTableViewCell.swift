//
//  BaseTableViewCell.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

import UIKit

extension BaseTableViewCell {
	static var identifier: String {
		"\(self)"
	}
}

class BaseTableViewCell: UITableViewCell {

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubviews()
		makeConstraints()
		setup()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func addSubviews() { }
	func makeConstraints() { }
	func setup() { }
}
