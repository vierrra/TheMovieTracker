//
//  SearchViewController.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 18/08/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var screen: SearchTableViewScreen?
    private var listMovies: [AllMovies] = [AllMovies(image: "cobra", title: "Cobra", review: 9.3, genre: "Ação", year: 1980, time: 140),
                                           AllMovies(image: "divertidamente", title: "Divertidamente", review: 9.5, genre: "Anime", year: 2024, time: 140),
                                           AllMovies(image: "incrivel_hulk", title: "Incrível Hulk", review: 9.5, genre: "Anime", year: 2024, time: 140),
                                           AllMovies(image: "onde_love", title: "One Love", review: 10.0, genre: "Biografia", year: 2024, time: 140),
                                           AllMovies(image: "rocky", title: "Rocky IV", review: 10.0, genre: "Ação", year: 2024, time: 140),
                                           AllMovies(image: "sonic", title: "Sonic", review: 8.0, genre: "Anime", year: 2020, time: 140),
                                           AllMovies(image: "spiderman", title: "Spiderman", review: 5.0, genre: "Aventura", year: 2015, time: 140),
                                           AllMovies(image: "Tropa_de_Elite_2", title: "Tropa de elite 2", review: 10, genre: "Policial", year: 2005, time: 140),
                                           AllMovies(image: "volta_para_futuro", title: "De volta para o futuro", review: 9.5, genre: "Ação", year: 2024, time: 140),
                                           AllMovies(image: "volverine", title: "Wolverine", review: 9.5, genre: "Besteirol", year: 2024, time: 140),
                                           
    ]
    
    private var filteredMovies = [AllMovies]()
    
    override func loadView() {
        screen = SearchTableViewScreen()
        view = screen
        
        screen?.configProtocols(self, self, self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredMovies = listMovies
        customizeNavigation()
    }
    
    private func customizeNavigation() {
            title = "Busque pelo filme"
            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            
            self.navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func configFilteredDataSearchBar() {
        screen?.searchBar.onTextDidChange = { [weak self] searchText in
            guard let self = self else { return }
            if searchText.isEmpty {
                self.filteredMovies = self.listMovies
            } else {
                self.filteredMovies = self.listMovies.filter { movie in
                    movie.title.lowercased().contains(searchText.lowercased())
                }
            }
            
            screen?.tableView.reloadData()
        }
        
        screen?.searchBar.onCancelButtonClicked = { [weak self] in
            self?.filteredMovies = self?.listMovies ?? []
            self?.screen?.tableView.reloadData()
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    
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

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies.isEmpty ? 1 : filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if filteredMovies.isEmpty {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EmptyStateTableViewCell.identifier, for: indexPath) as? EmptyStateTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchBarTableViewCell.identifier, for: indexPath) as? SearchBarTableViewCell else {
                return UITableViewCell()
            }
            
            cell.titleLabel.text = filteredMovies[indexPath.row].title
            cell.setupCell(filteredMovies[indexPath.row])
            return cell
        }
    }
}
