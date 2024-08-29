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
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    lazy var nview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .viewBackground
        return view
    }()
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: FavoritesTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()
 
    private func setup() {
        addElements()
        configConstraints()
    }
    
    public func configProtocols(_ tableViewDelegate: UITableViewDelegate, _ tableViewDataSource: UITableViewDataSource) {
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
    }
    
    // MARK: Todos os elementos da tela, serao chamados aqui, para serem add na view
    func addElements() {
        addSubview(nview)
        addSubview(tableView)
    
    }
    
    func configConstraints () {
        
        nview.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, trailing: trailingAnchor, size: CGSize(width: 0, height: 2))
        
        tableView.anchor(top: nview.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
}
