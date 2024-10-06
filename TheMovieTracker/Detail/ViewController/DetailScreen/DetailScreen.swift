//
//  DetailScreen.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 30/09/24.
//

import UIKit

protocol DetailScreenProtocol: AnyObject {
    func segmentChanged(_ sender: UISegmentedControl)
}

class DetailScreen: UIView {
    
    private weak var delegate: DetailScreenProtocol?

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
    
    lazy var calendarImageView: UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "calendar")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .detailMovies
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var calendarLabel: UILabel = {
        let label = UILabel()
        label.text = "2021"
        label.textColor = .detailMovies
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var firstSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .detailMovies
        return view
    }()
    
    lazy var timeImageView: UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "clock")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .detailMovies
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "139 minutos"
        label.textColor = .detailMovies
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var secondSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .detailMovies
        return view
    }()
    
    lazy var genreImageView: UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "movieclapper")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .detailMovies
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.text = "Anime"
        label.textColor = .detailMovies
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var segmentControl: UISegmentedControl = {
        let items = ["Sobre", "Reviews", "Elenco"]
        let segmentControl =  UISegmentedControl(items: items)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        
        return segmentControl
    }()
    
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        delegate?.segmentChanged(sender)
    }
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    public func delegate(delegate: DetailScreenProtocol) {
        self.delegate = delegate
    }
    
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
        addSubview(calendarImageView)
        addSubview(calendarLabel)
        addSubview(firstSeparatorView)
        addSubview(timeImageView)
        addSubview(timeLabel)
        addSubview(secondSeparatorView)
        addSubview(genreImageView)
        addSubview(genreLabel)
        addSubview(segmentControl)
        addSubview(descriptionLabel)
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
        
        calendarImageView.anchor(top: contentView.bottomAnchor, leading: leadingAnchor, padding: UIEdgeInsets(top: 20, left: 70, bottom: 0, right: 0), size: CGSize(width: 16, height: 16))
        
        calendarLabel.anchor(leading: calendarImageView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0))
        calendarLabel.yAnchor(yAnchor: calendarImageView.centerYAnchor)
        
        firstSeparatorView.anchor(leading: calendarLabel.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0), size: CGSize(width: 1, height: 18))
        firstSeparatorView.yAnchor(yAnchor: calendarLabel.centerYAnchor)
        
        timeImageView.anchor(leading: firstSeparatorView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0), size: CGSize(width: 16, height: 16))
        timeImageView.yAnchor(yAnchor: firstSeparatorView.centerYAnchor)
        
        timeLabel.anchor(leading: timeImageView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0))
        timeLabel.yAnchor(yAnchor: timeImageView.centerYAnchor)
        
        secondSeparatorView.anchor(leading: timeLabel.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0), size: CGSize(width: 1, height: 18))
        secondSeparatorView.yAnchor(yAnchor: timeLabel.centerYAnchor)
        
        genreImageView.anchor(leading: secondSeparatorView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0), size: CGSize(width: 16, height: 16))
        genreImageView.yAnchor(yAnchor: secondSeparatorView.centerYAnchor)
        
        genreLabel.anchor(leading: genreImageView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0))
        genreLabel.yAnchor(yAnchor: genreImageView.centerYAnchor)
        
        segmentControl.anchor(top: timeLabel.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 20))
        
        descriptionLabel.anchor(top: segmentControl.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 10))
    }
}
