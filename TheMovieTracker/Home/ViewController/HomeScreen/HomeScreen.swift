//
//  HomeScreen.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 24/08/24.
//

import UIKit

class HomeScreen: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .viewBackground
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var searchBar: DefaultSearchBar = {
        let searchBar = DefaultSearchBar()
        return searchBar
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        return tableView
    }()
    
    public func configProtocols(_ searchBarDelegate: UISearchBarDelegate, _ tableViewDelegate: UITableViewDelegate, _ tableViewDataSource: UITableViewDataSource) {
        searchBar.delegate = searchBarDelegate
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
    }
    
    private func setup() {
        buildViewHierarchy()
        configConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(searchBar)
        addSubview(tableView)
    }
    
    private func configConstraints() {
        searchBar.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, trailing: trailingAnchor, size: CGSize(width: 0, height: 48))
        
        tableView.anchor(top: searchBar.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
}
