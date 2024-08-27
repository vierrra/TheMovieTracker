//
//  FavoritesScreen.swift
//  TheMovieTracker
//
//  Created by Thiago Valentim on 26/08/24.
//

import UIKit

class FavoritesScreen: UIView {

    
    init() {
        super.init(frame: .zero)
        backgroundColor = .viewBackground
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
//        tableView.allowsSelection = false
        return tableView
    }()
    
    // MARK: Todos os elementos da tela, serao chamados aqui, para serem add na view
    func addElements() {
        addSubview(tableView)
    }

    // MARK: Setando as contraints de cada elemento presente na screen
    func configConstraints () {
       
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo:  leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
      tableView.delegate = delegate
      tableView.dataSource = dataSource
    }
 
}
