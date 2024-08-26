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
        contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        buildViewHierarchy()
        configConstraints()
    }
    
    private func buildViewHierarchy() {
        
    }
    
    private func configConstraints() {
        
    }
}
