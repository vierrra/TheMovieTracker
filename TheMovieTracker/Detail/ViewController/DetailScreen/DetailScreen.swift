//
//  DetailScreen.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 30/09/24.
//

import UIKit

class DetailScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .viewBackground
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Detalhes"
        return label
    }()
    
    lazy var favoriteImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "favorite2")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .viewBackground
        return view
    }()
    
    lazy var backMovieBannerImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "spidermanback")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var principalMovieBannerImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "spiderman")
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 16
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Spiderman No Way Home"
        return label
    }()
    
    lazy var reviewContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .viewBackground
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var starImageView: UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .orange
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var filmReviewLabel: UILabel = {
        let label = UILabel()
        label.text = "9.5"
        label.textColor = .orange
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private func setup() {
        buildViewHierarchy()
        configConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(detailLabel)
        addSubview(favoriteImageView)
        addSubview(contentView)
        contentView.addSubview(backMovieBannerImageView)
        contentView.addSubview(principalMovieBannerImageView)
        contentView.addSubview(titleLabel)
        backMovieBannerImageView.addSubview(reviewContentView)
        reviewContentView.addSubview(starImageView)
        reviewContentView.addSubview(filmReviewLabel)
    }
    
    private func configConstraints() {
        detailLabel.anchor(top: topAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        detailLabel.xAnchor(xAnchor: centerXAnchor)
        
        favoriteImageView.anchor(trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 33), size: CGSize(width: 18, height: 24))
        favoriteImageView.yAnchor(yAnchor: detailLabel.centerYAnchor)
        
        contentView.anchor(top: detailLabel.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 270))
        
        backMovieBannerImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, size: CGSize(width: 0, height: 210))
        
        principalMovieBannerImageView.anchor(leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0), size: CGSize(width: 95, height: 120))
        
        titleLabel.anchor(top: backMovieBannerImageView.bottomAnchor ,leading: principalMovieBannerImageView.trailingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        
        reviewContentView.anchor(bottom: backMovieBannerImageView.bottomAnchor, trailing: backMovieBannerImageView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 10), size: CGSize(width: 54, height: 24))
        
        starImageView.anchor(leading: reviewContentView.leadingAnchor, padding: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0), size: CGSize(width: 16, height: 16))
        starImageView.yAnchor(yAnchor: reviewContentView.centerYAnchor)
        
        filmReviewLabel.anchor(trailing: reviewContentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8), size: CGSize(width: 18, height: 15))
        filmReviewLabel.yAnchor(yAnchor: starImageView.centerYAnchor)
    }
    
}
