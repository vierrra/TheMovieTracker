//
//  MoviesCategoryCollectionViewCell.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 29/08/24.
//

import UIKit

class MoviesCategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: MoviesCategoryCollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
        
        contentView.backgroundColor = .viewBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var bannerMovie: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "incrivel_hulk")
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.contentMode = .scaleAspectFill
        return image
    }()
    
//    public func setupCell(_ indexPath: Int, _ detailMovie: [DetailMovies]) {
//        bannerMovie.image = UIImage(named: detailMovie[indexPath].bannerMovie)
//    }
    
    private func setup() {
        buildViewHierarchy()
        configConstraints()
    }
    
    private func buildViewHierarchy() {
        contentView.addSubview(bannerMovie)
    }
    
    private func configConstraints() {
        bannerMovie.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
}
