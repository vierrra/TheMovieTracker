//
//  HomeTableViewCellViewModel.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 25/08/24.
//

import UIKit

class Top10CollectionTableViewModel {
    private var movie: Movies?

    func setMovie(movie: Movies) {
      self.movie = movie
    }

    var numberOfItemsInSection: Int {
      return movie?.list.count ?? 0
    }

    func loadCurrentItem(indexPath: IndexPath) -> DetailMovies {
        return movie?.list[indexPath.row] ?? DetailMovies(titleMovie: "", bannerMovie: "")
    }

//    func getTitle(indexPath: IndexPath) -> String {
//      return loadCurrentItem(indexPath: indexPath).text
//    }
}
