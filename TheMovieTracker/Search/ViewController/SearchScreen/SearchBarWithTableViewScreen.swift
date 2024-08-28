//
//  SearchBarWithTableViewScreen.swift
//  SearchBarWithTableView
//
//  Created by Renato Vieira on 23/08/24.
//

import UIKit

class SearchBarWithTableViewScreen: UIView {
    
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
        tableView.register(SearchBarTableViewCell.self, forCellReuseIdentifier: SearchBarTableViewCell.identifier)
        tableView.register(EmptyStateTableViewCell.self, forCellReuseIdentifier: EmptyStateTableViewCell.identifier)
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
        
        tableView.anchor(top: searchBar.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
    }
}
