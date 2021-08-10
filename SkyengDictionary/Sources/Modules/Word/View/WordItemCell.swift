//
//  WordItemCell.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

import UIKit
import SnapKit
import Kingfisher

private struct Appearance {
	let spacing: CGFloat = 8
	let sideInset: CGFloat = 16
	let imageSize: CGSize = CGSize(width: 56, height: 56)
	let font: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular)
	let borderWidth: CGFloat = 0.5
}

final class WordItemCell: BaseTableViewCell {
	private let appearance = Appearance()

	private lazy var meaningImage: UIImageView = {
		let view = UIImageView()
		view.contentMode = .scaleAspectFill
		view.layer.cornerRadius = appearance.imageSize.width / 2
		view.layer.borderColor = UIColor.systemGray.cgColor
		view.layer.borderWidth = appearance.borderWidth
		view.clipsToBounds = true
		return view
	}()

	private lazy var definitionLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = appearance.font
		return label
	}()

	private lazy var meaningLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = appearance.font
		return label
	}()

	override func addSubviews() {
		super.addSubviews()
		contentView.addSubview(meaningImage)
		contentView.addSubview(meaningLabel)
		contentView.addSubview(definitionLabel)
	}

	override func makeConstraints() {
		super.makeConstraints()
		meaningImage.snp.makeConstraints { make in
			make.top.leading.equalToSuperview().inset(appearance.sideInset)
			make.size.equalTo(appearance.imageSize)
			make.bottom.lessThanOrEqualToSuperview().inset(appearance.sideInset).priority(.medium)
		}

		meaningLabel.snp.makeConstraints { make in
			make.top.equalTo(meaningImage.snp.top)
			make.leading.equalTo(meaningImage.snp.trailing).offset(appearance.spacing)
			make.trailing.equalToSuperview().inset(appearance.sideInset)
		}

		definitionLabel.snp.makeConstraints { make in
			make.leading.equalTo(meaningLabel.snp.leading)
			make.trailing.equalTo(meaningLabel.snp.trailing)
			make.top.equalTo(meaningLabel.snp.bottom).offset(appearance.spacing)
			make.bottom.equalToSuperview().inset(appearance.sideInset)
		}
	}

	override func setup() {
		super.setup()
		selectionStyle = .none
		backgroundColor = .systemBackground
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		meaningImage.kf.cancelDownloadTask()
	}

	func update(viewModel: WordItemViewModel) {
		meaningImage.kf.setImage(with: viewModel.imageUrl)
		meaningLabel.text = viewModel.translation
		definitionLabel.text = viewModel.definition
	}
}
