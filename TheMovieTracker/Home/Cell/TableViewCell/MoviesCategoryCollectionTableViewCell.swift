//
//  MoviesCategoryCollectionTableViewCell.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 29/08/24.
//

import UIKit

class MoviesCategoryCollectionTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: MoviesCategoryCollectionTableViewCell.self)

   // private var viewModel: Top10CollectionTableViewModel = Top10CollectionTableViewModel()
    
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
    
    public func setupCell(_ indexPath: Int? = nil , _ movies: Movies) {
        //viewModel.setMovie(movie: movies)
    }
    
    private func setup() {
        buildViewHierarchy()
        configConstraints()
    }
    
    private func buildViewHierarchy() {
        contentView.addSubview(collectionView)
    }
    
    private func configConstraints() {
        collectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
}

extension MoviesCategoryCollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCategoryCollectionViewCell.identifier, for: indexPath) as? MoviesCategoryCollectionViewCell
        
        return cell ?? UICollectionViewCell()
        //        cell?.setupCell(indexPath.row + 1, viewModel.loadCurrentItem(indexPath: indexPath))
        
    }
}
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            return CGSize(width: 2500, height: 200) // Defina o tamanho da célula
//        }}
