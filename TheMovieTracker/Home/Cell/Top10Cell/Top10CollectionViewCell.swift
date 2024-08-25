//
//  Top10CollectionViewCell.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 25/08/24.
//

import UIKit

class Top10CollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: Top10CollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    lazy var bannerMovie: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "incrivel_hulk")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    public func setupCell(_ detailMovie: DetailMovies) {
        bannerMovie.image = UIImage(named: detailMovie.bannerMovie)
    }
    
    private func setup() {
        buildViewHierarchy()
        configConstraints()
    }
    
    private func buildViewHierarchy() {
        contentView.addSubview(cardView)
        cardView.addSubview(bannerMovie)
    }
    
    private func configConstraints() {
        cardView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
        bannerMovie.anchor(top: cardView.topAnchor, leading: cardView.leadingAnchor, bottom: cardView.bottomAnchor, trailing: cardView.trailingAnchor)
    }
}
