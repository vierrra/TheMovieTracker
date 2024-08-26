//
//  MovieTableViewCell.swift
//  TheMovieTracker
//
//  Created by Thiago Valentim on 26/08/24.
//

import UIKit

protocol FavoritesTableViewCellProtocol: AnyObject {
    func tappedDeletePerson(movies: Movies?)
}



class MovieTableViewCell: UITableViewCell {

   
        
        static var identifier = String(describing: MovieTableViewCell.self)
        var movies: Movies?
        weak var delegate: MovieTableViewCell? // necessario quando for adicionar funcao de selecionar a cell
        
        
        lazy var coverImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
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
            backgroundColor = .appBackGround
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
                coverImageView.heightAnchor.constraint(equalToConstant: 100),
                coverImageView.widthAnchor.constraint(equalToConstant: 100),

                
                titleMovieLabel.topAnchor.constraint(equalTo: coverImageView.topAnchor, constant: 10),
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
        
        func setupCell(movies: Movies) {
            self.movies = movies
            titleMovieLabel.text  = movies.name  //nome do elemento da cell -> tipo = nomeDoParametroDoMetodo -> nome var da struc
            coverImageView.image = UIImage(systemName: movies.cover)
            starImageView.image = UIImage(systemName: movies.starImage)?.withTintColor(.orange, renderingMode: .alwaysOriginal)
            ratingLabel.text = movies.rating
            ticketImageView.image = UIImage(systemName: movies.ticketImage)?.withTintColor(.white, renderingMode: .alwaysOriginal)
            genderLabel.text = movies.gender
            calenderImageView.image = UIImage(systemName: movies.calenderImage)?.withTintColor(.white, renderingMode: .alwaysOriginal)
            releaseDataLabel.text = movies.releaseDate
            clockImageView.image = UIImage(systemName: movies.clockImage)?.withTintColor(.white, renderingMode: .alwaysOriginal)
            durationTimeLabel.text = movies.durationTime
            
            
        }
        
  
    
}
