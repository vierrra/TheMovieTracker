//
//  CategoryCollectionTableViewModel.swift.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 29/08/24.
//

import UIKit

class CategoryCollectionTableViewModel {
    private var movies: [Movies]?

    func setMovie(movies: [Movies]) {
      self.movies = movies
    }

    var numberOfItemsInSection: Int {
    
        return 4
    }

    func loadCurrentItem(indexPath: IndexPath) -> Movies {
        return movies?[indexPath.row] ?? Movies(category: "", isSelected: false, list: [])
    }

//    func getTitle(indexPath: IndexPath) -> String {
//      return loadCurrentItem(indexPath: indexPath).text
//    }
}
