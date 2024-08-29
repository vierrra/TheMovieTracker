//

import UIKit

class SearchBarTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: SearchBarTableViewCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .viewBackground
        selectionStyle = .none
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var bannerImageView: UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(named: "divertidamente")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Divertidamente"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var starImageView: UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .orange
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
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
    
    lazy var genreImageView: UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "movieclapper")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.text = "Anime"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var calendarImageView: UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "calendar")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var calendarLabel: UILabel = {
        let label = UILabel()
        label.text = "2019"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var timeImageView: UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "clock")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "139 minutos"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    public func setupCell(_ movie: AllMovies) {
        bannerImageView.image = UIImage(named: movie.image)
        titleLabel.text = movie.title
        filmReviewLabel.text = "\(movie.review)"
        genreLabel.text = movie.genre
        calendarLabel.text = "\(movie.year)"
        timeLabel.text = "\(movie.time) minutos"
    }
    
    private func setup() {
        self.buildViewHierarchy()
        self.configConstraints()
    }
    
    private func buildViewHierarchy() {
        contentView.addSubview(bannerImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(starImageView)
        contentView.addSubview(filmReviewLabel)
        contentView.addSubview(genreImageView)
        contentView.addSubview(genreLabel)
        contentView.addSubview(calendarImageView)
        contentView.addSubview(timeImageView)
        contentView.addSubview(calendarLabel)
        contentView.addSubview(timeLabel)
    }
    
    private func configConstraints() {
        bannerImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 20, right: 0), size: CGSize(width: 95, height: 120))
        
        titleLabel.anchor(top: contentView.topAnchor, leading: bannerImageView.trailingAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 0))
        
        starImageView.anchor(top: titleLabel.bottomAnchor, leading: bannerImageView.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 10, bottom: 0, right: 0), size: CGSize(width: 16, height: 16))
        
        filmReviewLabel.anchor(top: titleLabel.bottomAnchor, leading: starImageView.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 5, bottom: 0, right: 0))
        
        genreImageView.anchor(top: starImageView.bottomAnchor, leading: bannerImageView.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 0), size: CGSize(width: 16, height: 16))
        
        genreLabel.anchor(top: filmReviewLabel.bottomAnchor, leading: genreImageView.trailingAnchor, padding: UIEdgeInsets(top: 8, left: 5, bottom: 0, right: 0))
        
        calendarImageView.anchor(top: genreImageView.bottomAnchor, leading: bannerImageView.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 0), size: CGSize(width: 16, height: 16))
        
        calendarLabel.anchor(top: genreLabel.bottomAnchor, leading: calendarImageView.trailingAnchor, padding: UIEdgeInsets(top: 8, left: 5, bottom: 0, right: 0))
        
        timeImageView.anchor(top: calendarImageView.bottomAnchor, leading: bannerImageView.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 0), size: CGSize(width: 16, height: 16))
        
        timeLabel.anchor(top: calendarLabel.bottomAnchor, leading: timeImageView.trailingAnchor, padding: UIEdgeInsets(top: 6, left: 5, bottom: 0, right: 0))
    }
}
