//
//  HomeTableViewCell.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 24/08/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: HomeTableViewCell.self)
    
    private var itemCount: Int = 0
    private var viewModel: HomeTableViewCellViewModel = HomeTableViewCellViewModel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        //Aqui registrar as três células
        collectionView.register(Top10CollectionViewCell.self, forCellWithReuseIdentifier: Top10CollectionViewCell.identifier)
        return collectionView
    }()
    
    private func configureHorizontalCollectionLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 230)
        layout.minimumLineSpacing = 10
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = layout
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func configureFixedCollectionLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 20)
        layout.estimatedItemSize = CGSize(width: 100, height: 20)
        layout.minimumLineSpacing = 5
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = layout
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func configureVerticalCollectionLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 10
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = layout
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    public func setupCell(_ indexPath: Int, _ movies: Movies) {
        switch indexPath {
        case 0:
            itemCount = 10
            configureHorizontalCollectionLayout()
            viewModel.setMovie(movie: movies)
        case 1:
            itemCount = 4
            configureFixedCollectionLayout()
        case 2:
            itemCount = 6
        default:
            itemCount = 0
        }
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

extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Aqui é onde definirei qual cell da collection será utilizada que neste caso serão 3 células
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Top10CollectionViewCell.identifier, for: indexPath) as? Top10CollectionViewCell
//        cell?.setupCell(viewModel.loadCurrentItem(indexPath: indexPath))
//        return cell ?? UICollectionViewCell()
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Top10CollectionViewCell.identifier, for: indexPath) as? Top10CollectionViewCell
            cell?.setupCell(viewModel.loadCurrentItem(indexPath: indexPath))
            return cell ?? UICollectionViewCell()
        } else {
            return UICollectionViewCell()
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            return CGSize(width: 2500, height: 200) // Defina o tamanho da célula
//        }
}
