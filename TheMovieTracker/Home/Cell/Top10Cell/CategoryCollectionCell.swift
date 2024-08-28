//
//  CategoryCollectionCell.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 26/08/24.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: CategoryCollectionCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .medium)
        //label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        label.text = "Assista agora"
        return label
    }()
    
    private func setup() {
        buildViewHierarchy()
        configConstraints()
    }
    
    private func buildViewHierarchy() {
        contentView.addSubview(categoryLabel)
    }
    
    private func configConstraints() {
        categoryLabel.xAnchor(xAnchor: contentView.centerXAnchor)
        categoryLabel.yAnchor(yAnchor: contentView.centerYAnchor)
    }
}
