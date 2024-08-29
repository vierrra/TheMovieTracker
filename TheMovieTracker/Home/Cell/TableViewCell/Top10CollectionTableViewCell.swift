//
//  Top10CollectionTableViewCell.swift.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 24/08/24.
//

import UIKit

class Top10CollectionTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: Top10CollectionTableViewCell.self)

    private var viewModel: Top10CollectionTableViewModel = Top10CollectionTableViewModel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .viewBackground
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 230)
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = layout
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(Top10CollectionViewCell.self, forCellWithReuseIdentifier: Top10CollectionViewCell.identifier)
        return collectionView
    }()
    
    public func setupCell(_ indexPath: Int? = nil , _ movies: Movies) {
        viewModel.setMovie(movie: movies)
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

extension Top10CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Top10CollectionViewCell.identifier, for: indexPath) as? Top10CollectionViewCell
        cell?.setupCell(indexPath.row + 1, viewModel.loadCurrentItem(indexPath: indexPath))
        return cell ?? UICollectionViewCell()
        
    }
}
