//
//  MovieTableViewCell.swift
//  TheMovieTracker
//
//  Created by Thiago Valentim on 26/08/24.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    
    static var identifier = String(describing: FavoritesTableViewCell.self)
    
    lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var titleMovieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        return imageView
    }()
    
    lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var ticketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .bottomLeft
        imageView.image = UIImage(systemName: "movieclapper")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        return imageView
    }()
    
    lazy  var genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    lazy var calenderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .bottomLeft
        imageView.image = UIImage(systemName: "calendar")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        return imageView
    }()
    
    lazy  var releaseDataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    lazy var clockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .bottomLeft
        imageView.image = UIImage(systemName: "clock")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        return imageView
    }()
    
    lazy  var durationTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .viewBackground
        addElements()
        configConstrainst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElements() {
        contentView.addSubview(coverImageView)
        contentView.addSubview(titleMovieLabel)
        contentView.addSubview(starImageView)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(ticketImageView)
        contentView.addSubview(genderLabel)
        contentView.addSubview(calenderImageView)
        contentView.addSubview(releaseDataLabel)
        contentView.addSubview(clockImageView)
        contentView.addSubview(durationTimeLabel)
    }
    
    func configConstrainst() {
        NSLayoutConstraint.activate([
            
            coverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            coverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            coverImageView.heightAnchor.constraint(equalToConstant: 170),
            coverImageView.widthAnchor.constraint(equalToConstant: 130),
  
            titleMovieLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleMovieLabel.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: 20),
            titleMovieLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
         
            starImageView.topAnchor.constraint(equalTo: titleMovieLabel.bottomAnchor, constant: 20),
            starImageView.leadingAnchor.constraint(equalTo: titleMovieLabel.leadingAnchor),
            starImageView.heightAnchor.constraint(equalToConstant: 25),
            starImageView.widthAnchor.constraint(equalToConstant: 25),
            
            ratingLabel.topAnchor.constraint(equalTo: titleMovieLabel.bottomAnchor, constant: 20),
            ratingLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 10),
            
            ticketImageView.topAnchor.constraint(equalTo: starImageView.bottomAnchor, constant: 5),
            ticketImageView.leadingAnchor.constraint(equalTo: starImageView.leadingAnchor),
            ticketImageView.heightAnchor.constraint(equalToConstant: 25),
            ticketImageView.widthAnchor.constraint(equalToConstant: 25),
            
            genderLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 10),
            genderLabel.leadingAnchor.constraint(equalTo: ticketImageView.trailingAnchor, constant: 10),
            
            calenderImageView.topAnchor.constraint(equalTo: ticketImageView.bottomAnchor, constant: 5),
            calenderImageView.leadingAnchor.constraint(equalTo: ticketImageView.leadingAnchor),
            calenderImageView.heightAnchor.constraint(equalToConstant: 25),
            calenderImageView.widthAnchor.constraint(equalToConstant: 25),
            
            releaseDataLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            releaseDataLabel.leadingAnchor.constraint(equalTo: calenderImageView.trailingAnchor, constant: 10),
            
            clockImageView.topAnchor.constraint(equalTo: calenderImageView.bottomAnchor, constant: 5),
            clockImageView.leadingAnchor.constraint(equalTo: calenderImageView.leadingAnchor),
            clockImageView.heightAnchor.constraint(equalToConstant: 25),
            clockImageView.widthAnchor.constraint(equalToConstant: 25),
            clockImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            
            durationTimeLabel.topAnchor.constraint(equalTo: calenderImageView.bottomAnchor, constant: 10),
            durationTimeLabel.leadingAnchor.constraint(equalTo: clockImageView.trailingAnchor, constant: 10),
        ])
    }
    
    func setupCell(movie: FavoritesMovies) {
        titleMovieLabel.text  = movie.name
        coverImageView.image = UIImage(named: movie.cover)
        ratingLabel.text = movie.rating
        genderLabel.text = movie.gender
        releaseDataLabel.text = movie.releaseDate
        durationTimeLabel.text = movie.durationTime
    }
}
