//
//  ItemTableViewCell.swift
//  Expo1900
//
//  Created by Kiwi, Finnn on 2022/06/16.
//

import UIKit

final class ItemTableViewCell: UITableViewCell {
    
    private var itemInfo: Entry? {
        didSet {
            itemTitleLabel.text = itemInfo?.name
            itemImageView.image = itemInfo?.image
            itemShortDescriptionLable.text = itemInfo?.shortDescription
            layoutIfNeeded()
        }
    }
    
    private let itemTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let itemShortDescriptionLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    private let itemLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        
        setupSubviews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        contentView.addSubview(itemImageView)
        contentView.addSubview(itemLabelStackView)
    
        [itemTitleLabel, itemShortDescriptionLable].forEach {
            itemLabelStackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            itemImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.15),
            itemImageView.topAnchor.constraint(equalTo: topAnchor),
            itemImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            itemImageView.trailingAnchor.constraint(equalTo: itemLabelStackView.leadingAnchor,constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            itemLabelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            itemLabelStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            itemLabelStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func updateEntry(by entry: Entry?) {
        itemInfo = entry
    }
}
