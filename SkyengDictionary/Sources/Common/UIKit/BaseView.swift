//
//  BaseView.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 07.08.2021.
//

import UIKit

class BaseView: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
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
