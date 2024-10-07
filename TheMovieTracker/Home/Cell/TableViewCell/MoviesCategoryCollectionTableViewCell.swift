//
//  MoviesCategoryCollectionTableViewCell.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 29/08/24.
//

import UIKit

protocol MoviesCategoryCollectionTableViewCellProtocol: AnyObject {
    func didSelectItemMoviesCategory(at indexPath: IndexPath)
}

class MoviesCategoryCollectionTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: MoviesCategoryCollectionTableViewCell.self)

    private var viewModel: MoviesCategoryCollectionTableViewModel = MoviesCategoryCollectionTableViewModel()
    private weak var delegate: MoviesCategoryCollectionTableViewCellProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 145)
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = layout
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .viewBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MoviesCategoryCollectionViewCell.self, forCellWithReuseIdentifier: MoviesCategoryCollectionViewCell.identifier)
        return collectionView
    }()
    
    public func delegate(delegate: MoviesCategoryCollectionTableViewCellProtocol) {
        self.delegate = delegate
    }
    
    public func setupCell(_ movies: [Movies]) {
        viewModel.setMovie(movies: movies)
    }
    
    private func setup() {
        buildViewHierarchy()
        configConstraints()
    }
    
    private func buildViewHierarchy() {
        contentView.addSubview(collectionView)
    }
    
    private func configConstraints() {
        collectionView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, size: CGSize(width: 0, height: MoviesCategoryCollectionViewCell.heightCell))
        //collectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
}

extension MoviesCategoryCollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCategoryCollectionViewCell.identifier, for: indexPath) as? MoviesCategoryCollectionViewCell
        
        //cell?.setupCell(indexPath.row, viewModel.loadCurrentItem(indexPath: indexPath))
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItemMoviesCategory(at: indexPath)
    }
}

