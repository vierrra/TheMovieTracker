//
//  HomeViewController.swift
//  PrimeiroAppMVVM
//
//  Created by Renato Vieira on 18/08/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var screen: HomeScreen?
    //private var data = ["Apple", "Banana", "Cherry", "Date", "Fig", "Grape", "Lemon", "Mango", "Orange", "Peach"]
    private var filteredData = [String]()
    
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
    
    private func configFilteredDataSearchBar() {
        screen?.searchBar.onTextDidChange = { [weak self] searchText in
            guard let self = self else { return }
            if searchText.isEmpty {
                //self.filteredData = self.data
            } else {
                //self.filteredData = self.data.filter { $0.lowercased().contains(searchText.lowercased()) }
            }
            
            screen?.tableView.reloadData()
        }
        
        screen?.searchBar.onCancelButtonClicked = { [weak self] in
            //self?.filteredData = self?.data ?? []
            self?.screen?.tableView.reloadData()
        }
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        configFilteredDataSearchBar()
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = filteredData[indexPath.row]
        //cell.contentView.backgroundColor = .viewBackground
        return UITableViewCell()
    }
}

