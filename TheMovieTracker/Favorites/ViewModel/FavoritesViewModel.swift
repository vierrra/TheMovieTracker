//
//  FavoritesViewModel.swift
//  TheMovieTracker
//
//  Created by Thiago Valentim on 26/08/24.
//

import Foundation

class FavoritesViewModel {
    
  private var listMovie:
    [FavoritesMovies] = [FavoritesMovies(name: "Spiderman", cover: "spiderman", rating: "9.5", gender: "Ação", releaseDate: "2022", durationTime: "125 minutos"),
                FavoritesMovies(name: "Incrivel Hulk", cover: "incrivel_hulk", rating: "6.9", gender: "Aventura",  releaseDate: "2005", durationTime: "179 minutos" ),
                FavoritesMovies(name: "Divertidamente", cover: "divertidamente", rating: "8.9", gender: "Ação",  releaseDate: "2021", durationTime: "104 minutos"),
                FavoritesMovies(name: "One Love", cover: "one_love", rating: "9.5", gender: "Ficção científica", releaseDate: "1999", durationTime: "149 minutos" ),
                FavoritesMovies(name: "Sonic", cover: "sonic", rating: "9.5", gender: "Ficção científica",   releaseDate: "1994",  durationTime: "95 minutos" ),
                FavoritesMovies(name: "De Volta para o Futuro", cover: "volta_para_futuro", rating: "6.2", gender: "Ação",   releaseDate: "2014",  durationTime: "122 minutos" ),
                FavoritesMovies(name: "Wolverine", cover: "wolverine",  rating: "7.9", gender: "Comédia", releaseDate: "2009", durationTime: "109 minutos" ),]
 

    // função get de retorno
    func getListMovie() -> [FavoritesMovies] {
      return listMovie
    }

    // variável computada de retorno
    var getComputedListMovie: [FavoritesMovies] {
      return listMovie
    }

    var numberOfRowsInSection: Int {
      return listMovie.count
    }

    func loadCurrentMovie(indexPath: IndexPath) -> FavoritesMovies {
      return listMovie[indexPath.row]
    }

    
}

