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
        view.backgroundColor = .yellow
        return view
    }()
    
    lazy var backMovieBannerImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "spidermanback")
        image.contentMode = .scaleAspectFill
        return image
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
    }
    
    private func configConstraints() {
        detailLabel.anchor(top: topAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        detailLabel.xAnchor(xAnchor: centerXAnchor)
        
        favoriteImageView.anchor(trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 33), size: CGSize(width: 18, height: 24))
        favoriteImageView.yAnchor(yAnchor: detailLabel.centerYAnchor)
        
        contentView.anchor(top: detailLabel.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 270))
        
        backMovieBannerImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, size: CGSize(width: 0, height: 210))
    }
    
}
