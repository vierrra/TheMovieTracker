//
//  SearchViewController.swift
//  PrimeiroAppMVVM
//
//  Created by Renato Vieira on 18/08/24.
//

import UIKit

class FavoritesViewController: UIViewController {

    var screen: FavoritesScreen?
    var viewModel: FavoritesViewModel = FavoritesViewModel()
  

    override func loadView() {
        screen = FavoritesScreen()
        self.view = screen
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configProtocols(self, self)
        customizeNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        screen?.tableView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    private func customizeNavigation() {
                title = "Favoritos"
                let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
                
                self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        }
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}

extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchBarTableViewCell.identifier, for: indexPath) as? SearchBarTableViewCell
        
        cell?.setupCell(viewModel.loadCurrentMovie(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }    
}
