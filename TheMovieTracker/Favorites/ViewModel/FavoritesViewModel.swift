//
//  FavoritesViewModel.swift
//  TheMovieTracker
//
//  Created by Thiago Valentim on 26/08/24.
//

import Foundation

class FavoritesViewModel {
    
  private var listMovie:
    [Movies] = [Movies(name: "Spiderman", cover: "spiderman", starImage: "star", rating: "9.5", ticketImage: "ticket" , gender: "Ação", calenderImage: "calendar", releaseDate: "2022", clockImage: "clock", durationTime: "125 minutos"),
                Movies(name: "Incrivel Hulk", cover: "incrivel_hulk", starImage: "star", rating: "6.9", ticketImage:  "ticket", gender: "Aventura", calenderImage: "calendar", releaseDate: "2005", clockImage: "clock", durationTime: "179 minutos" ),
                Movies(name: "Divertidamente", cover: "divertidamente", starImage: "star", rating: "8.9", ticketImage: "ticket", gender: "Ação", calenderImage: "calendar", releaseDate: "2021", clockImage: "clock", durationTime: "104 minutos"),
                Movies(name: "One Love", cover: "one_love", starImage: "star", rating: "9.5", ticketImage: "ticket", gender: "Ficção científica",  calenderImage: "calendar", releaseDate: "1999", clockImage: "clock", durationTime: "149 minutos" ),
                Movies(name: "Sonic", cover: "sonic", starImage: "star", rating: "9.5", ticketImage: "ticket", gender: "Ficção científica",  calenderImage: "calendar", releaseDate: "1994", clockImage: "clock", durationTime: "95 minutos" ),
                Movies(name: "De Volta para o Futuro", cover: "volta_para_futuro", starImage: "star", rating: "6.2", ticketImage:"ticket", gender: "Ação",  calenderImage: "calendar", releaseDate: "2014", clockImage: "clock", durationTime: "122 minutos" ),
                Movies(name: "Wolverine", cover: "volverine", starImage: "star", rating: "7.9", ticketImage: "ticket", gender: "Comédia", calenderImage: "calendar", releaseDate: "2009", clockImage: "clock", durationTime: "109 minutos" ),]
 
 

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

