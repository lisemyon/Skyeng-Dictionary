//
//  SearchWordViewItemCell.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

import UIKit

private struct Appearance {
	let sideInset: CGFloat = 16
	let infoLabelFontSize: CGFloat = 16
}

final class SearchWordViewItemCell: BaseTableViewCell {
	private let appearance = Appearance()

	private lazy var infoLabel: UILabel = {
		let view = UILabel()
		view.numberOfLines = 0
		view.font = UIFont.systemFont(ofSize: appearance.infoLabelFontSize)
		return view
	}()

	override func addSubviews() {
		super.addSubviews()
		contentView.addSubview(infoLabel)
	}

	override func makeConstraints() {
		super.makeConstraints()
		infoLabel.snp.makeConstraints { make in
			make.edges.equalToSuperview().inset(appearance.sideInset)
		}
	}

	override func setup() {
		super.setup()
		contentView.backgroundColor = .systemBackground
		selectionStyle = .none
	}

	func update(viewModel: SearchWordItemViewModel) {
		infoLabel.text = viewModel.text
	}
}
