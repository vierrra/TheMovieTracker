//
//  FavoritesViewModel.swift
//  TheMovieTracker
//
//  Created by Thiago Valentim on 26/08/24.
//

import Foundation

class FavoritesViewModel {
    
  private var listMovie:
    [Movies] = [Movies(name: "Spiderman", cover: "spiderman", rating: "9.5", gender: "Ação", releaseDate: "2022", durationTime: "125 minutos"),
                Movies(name: "Incrivel Hulk", cover: "incrivel_hulk", rating: "6.9", gender: "Aventura",  releaseDate: "2005", durationTime: "179 minutos" ),
                Movies(name: "Divertidamente", cover: "divertidamente", rating: "8.9", gender: "Ação",  releaseDate: "2021", durationTime: "104 minutos"),
                Movies(name: "One Love", cover: "one_love", rating: "9.5", gender: "Ficção científica", releaseDate: "1999", durationTime: "149 minutos" ),
                Movies(name: "Sonic", cover: "sonic", rating: "9.5", gender: "Ficção científica",   releaseDate: "1994",  durationTime: "95 minutos" ),
                Movies(name: "De Volta para o Futuro", cover: "volta_para_futuro", rating: "6.2", gender: "Ação",   releaseDate: "2014",  durationTime: "122 minutos" ),
                Movies(name: "Wolverine", cover: "volverine",  rating: "7.9", gender: "Comédia", releaseDate: "2009", durationTime: "109 minutos" ),]
 

    // função get de retorno
    func getListMovie() -> [Movies] {
      return listMovie
    }

    // variável computada de retorno
    var getComputedListMovie: [Movies] {
      return listMovie
    }

    var numberOfRowsInSection: Int {
      return listMovie.count
    }

    func loadCurrentMovie(indexPath: IndexPath) -> Movies {
      return listMovie[indexPath.row]
    }

    
}

