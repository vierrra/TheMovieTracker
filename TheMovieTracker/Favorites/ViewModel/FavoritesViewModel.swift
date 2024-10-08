//
//  FavoritesViewModel.swift
//  TheMovieTracker
//
//  Created by Thiago Valentim on 26/08/24.
//

import Foundation

class FavoritesViewModel {
    
  private var listMovie:
    [AllMovies] = [AllMovies(image: "cobra", title: "Cobra", review: 9.3, genre: "Ação", year: 1980, time: 140),
                                           AllMovies(image: "divertidamente", title: "Divertidamente", review: 9.5, genre: "Anime", year: 2024, time: 140),
                                           AllMovies(image: "incrivel_hulk", title: "Incrível Hulk", review: 9.5, genre: "Anime", year: 2024, time: 140),
                                           AllMovies(image: "one_love", title: "One Love", review: 10.0, genre: "Biografia", year: 2024, time: 140),
                                           AllMovies(image: "rocky", title: "Rocky IV", review: 10.0, genre: "Ação", year: 2024, time: 140),
                                           AllMovies(image: "sonic", title: "Sonic", review: 8.0, genre: "Anime", year: 2020, time: 140),
                                           AllMovies(image: "spiderman", title: "Spiderman", review: 5.0, genre: "Aventura", year: 2015, time: 140),
                                           AllMovies(image: "tropa_elite_2", title: "Tropa de elite 2", review: 10, genre: "Policial", year: 2005, time: 140),
                                           AllMovies(image: "volta_para_futuro", title: "De volta para o futuro", review: 9.5, genre: "Ação", year: 2024, time: 140),
                                           AllMovies(image: "wolverine", title: "Wolverine", review: 9.5, genre: "Besteirol", year: 2024, time: 140),
                                           
    ]
 

    // função get de retorno
    func getListMovie() -> [AllMovies] {
      return listMovie
    }

    // variável computada de retorno
    var getComputedListMovie: [AllMovies] {
      return listMovie
    }

    var numberOfRowsInSection: Int {
      return listMovie.count
    }

    func loadCurrentMovie(indexPath: IndexPath) -> AllMovies {
      return listMovie[indexPath.row]
    }

    
}

