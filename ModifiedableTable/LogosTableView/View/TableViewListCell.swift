//
//  TableViewListCell.swift
//  ModifiedableTable
//
//  Created by Сергей Матвеенко on 25.05.23.
//

import UIKit

final class TableViewListCell: UITableViewCell {
    
    // MARK: - GUI

    private lazy var logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var commonLabelsStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubviews()
        self.setConstrains()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.logoView.image = nil
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
    }
    
    // MARK: - Constraints
    
    private func addSubviews() {
        self.contentView.addSubview(self.logoView)
        self.contentView.addSubview(self.commonLabelsStackView)
        self.commonLabelsStackView.addSubview(self.titleLabel)
        self.commonLabelsStackView.addSubview(self.descriptionLabel)
    }
    
    private func setConstrains() {
        self.logoView.snp.makeConstraints {
            $0.top.bottom.left.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(3)
        }
        
        self.commonLabelsStackView.snp.makeConstraints {
            $0.top.bottom.right.equalToSuperview()
            $0.left.equalTo(self.logoView.snp.right)
        }
        
        self.titleLabel.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(2)
        }
        
        self.descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom)
            $0.bottom.left.right.equalToSuperview()
        }
    }
    
    // MARK: - UI updating
    
    func setCellView(displayData: TableListViewController.DisplayData) {
        self.logoView.image = UIImage(systemName: displayData.logoName)
        self.titleLabel.text = displayData.title
        self.descriptionLabel.text = displayData.description
    }

}
