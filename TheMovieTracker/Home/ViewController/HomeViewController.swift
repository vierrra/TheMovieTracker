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
    
    //Adaptar depois quando for usar o search
    //private var filteredData = [String]()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
        
        screen?.configProtocols(self, self, self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeNavigation()
        //filteredData = data
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
    //Descomentar depois para usar o search
//    private func configFilteredDataSearchBar() {
//        screen?.searchBar.onTextDidChange = { [weak self] searchText in
//            guard let self = self else { return }
//            if searchText.isEmpty {
//                self.filteredData = self.data
//            } else {
//                self.filteredData = self.data.filter { $0.lowercased().contains(searchText.lowercased()) }
//            }
//            
//            screen?.tableView.reloadData()
//        }
//        
//        screen?.searchBar.onCancelButtonClicked = { [weak self] in
//            self?.filteredData = self?.data ?? []
//            self?.screen?.tableView.reloadData()
//        }
//    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //configFilteredDataSearchBar()
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
        //return filteredData.count
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Top10CollectionTableViewCell.identifier, for: indexPath) as? Top10CollectionTableViewCell
            //cell?.contentView.backgroundColor = .orange
            cell?.contentView.backgroundColor = .viewBackground
            cell?.setupCell(indexPath.row, viewModel.loadCurrentDetail(indexPath: indexPath))
            
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCollectionTableViewCell.identifier, for: indexPath)
            cell.contentView.backgroundColor = .viewBackground
            return cell
        case 2:
            print("Celula \(indexPath.row)")
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 250
        }
        
        if indexPath.row == 1 {
            return 25
        }
        
        return 300
    }
}

