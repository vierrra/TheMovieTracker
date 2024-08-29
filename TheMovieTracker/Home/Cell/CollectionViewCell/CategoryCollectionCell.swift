//
//  CategoryCollectionCell.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 26/08/24.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: CategoryCollectionCell.self)
    static let titleFont = UIFont.systemFont(ofSize: 12, weight: .medium)
    static let height: CGFloat = 40
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = CategoryCollectionCell.titleFont
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.text = "Assista agora"
        return label
    }()
    
    lazy var lineView: UIView = {
      let view = UIView()
      view.backgroundColor = .lightGray
      return view
    }()
    
    public func setupCell(movieCategory: Movies) {
    
        if movieCategory.category != "Top10" {
            categoryLabel.text = movieCategory.category
            categoryLabel.textColor = movieCategory.isSelected ? .white : .lightGray

            lineView.isHidden = !movieCategory.isSelected
        }
    }
    
    static func calculateSize(title: String) -> CGSize {
      let maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)
      let boundingBox = (title as NSString).boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: titleFont], context: nil)
      return CGSize(width: boundingBox.width + 20, height: height)
    }
    
    private func setup() {
        buildViewHierarchy()
        configConstraints()
    }
    
    private func buildViewHierarchy() {
        contentView.addSubview(categoryLabel)
        contentView.addSubview(lineView)
    }
    
    private func configConstraints() {
        categoryLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0))
        
        lineView.anchor(top: categoryLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 2))
    }
}
