//
//  MoviesCategoryCollectionTableViewModel.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 29/08/24.
//

import UIKit

class MoviesCategoryCollectionTableViewModel {
    private var movies: [Movies]?

    func setMovie(movies: [Movies]) {
      self.movies = movies
    }
    
    func numberOfItemsInSection(_ indexPath: Int) -> Int {
        return movies?[indexPath].list.count ?? 0
    }
    
//    func loadCurrentItem(indexPath: IndexPath) -> [DetailMovies] {
//        // Verifica se movies não é nulo e se o índice está dentro do intervalo permitido.
//        guard let movies = movies, indexPath.row >= 0, indexPath.row < movies.count else {
//            return [DetailMovies]() // Retorna um array vazio se of array está vazio ou índice fora do intervalo.
//        }
//
//        return movies[indexPath.row].list
//    }

//    func loadCurrentItem(indexPath: IndexPath) -> [DetailMovies] {
//        if let movies = movies {
//            return movies[indexPath.row].list
//        }
//        return [DetailMovies]()
//    }
}
