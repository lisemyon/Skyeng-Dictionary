//
//  SearchWordEmptyView.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

import UIKit
import SnapKit

private struct Appearance {
	let sideInset: CGFloat = 24
	let titleFontSize: CGFloat = 18
	let descriptionFontSize: CGFloat = 16
	let spacing: CGFloat = 12
}

final class SearchWordEmptyView: BaseView {
	private let appearance = Appearance()

	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.text = Texts.SearchWord.Empty.title.text
		label.font = UIFont.boldSystemFont(ofSize: appearance.titleFontSize)
		label.textAlignment = .center
		return label
	}()

	private lazy var descriptionLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.text = Texts.SearchWord.Empty.description.text
		label.font = UIFont.systemFont(ofSize: appearance.descriptionFontSize)
		label.textAlignment = .center
		return label
	}()

	private let container: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		return view
	}()

	override func addSubviews() {
		super.addSubviews()
		addSubview(container)
		container.addArrangedSubview(titleLabel)
		container.addArrangedSubview(descriptionLabel)
	}

	override func makeConstraints() {
		super.makeConstraints()
		container.snp.makeConstraints { make in
			make.leading.trailing.equalToSuperview().inset(appearance.sideInset)
			make.centerY.equalToSuperview()
			make.top.greaterThanOrEqualToSuperview()
			make.bottom.lessThanOrEqualToSuperview()
		}
		container.spacing = appearance.spacing
	}
}
