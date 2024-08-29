//
//  HomeViewController.swift
//  PrimeiroAppMVVM
//
//  Created by Renato Vieira on 18/08/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var screen: HomeScreen?
    private var viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
        
        screen?.configProtocols(self, self, self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeNavigation()
    }
    
    private func customizeNavigation() {
        title = "Home"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        let image = UIImage(systemName: "person.circle")
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(tappedUserProfile))
        
        barButtonItem.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func tappedUserProfile() {
        
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        screen?.searchBar.onTextDidChange?(searchText)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        screen?.searchBar.customizeCancelButton()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
        screen?.searchBar.onCancelButtonClicked?()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Top10CollectionTableViewCell.identifier, for: indexPath) as? Top10CollectionTableViewCell
            cell?.setupCell(indexPath.row, viewModel.loadCurrentDetail(indexPath: indexPath))
            
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCollectionTableViewCell.identifier, for: indexPath) as? CategoryCollectionTableViewCell
            cell?.setupCell(viewModel.loadCurrentListCategory())
            return cell ?? UITableViewCell()
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: MoviesCategoryCollectionTableViewCell.identifier, for: indexPath) as? MoviesCategoryCollectionTableViewCell
            cell?.setupCell(viewModel.loadCurrentListCategory())
            print("Celula \(indexPath.row)")
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 250
        }
        
        if indexPath.row == 1 {
            return 40
        }
        
        return 300
    }
}

