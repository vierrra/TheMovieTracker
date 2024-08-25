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
        let image = UIImageView()
        image.image = UIImage(named: "incrivel_hulk")
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var favoriteImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "favorite2")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .yellow
        image.contentMode = .scaleAspectFill
        image.isHidden = false
        return image
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
        bannerMovie.addSubview(favoriteImageView)
    }
    
    private func configConstraints() {
        cardView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
        bannerMovie.anchor(top: cardView.topAnchor, leading: cardView.leadingAnchor, bottom: cardView.bottomAnchor, trailing: cardView.trailingAnchor)
        
        favoriteImageView.anchor(top: bannerMovie.topAnchor, trailing: bannerMovie.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 10), size: CGSize(width: 25, height: 25))
    }
}
