//
//  HomeViewModel.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 25/08/24.
//

import UIKit

class HomeViewModel {
    
    private var listMovies: [Movies] = [Movies(category: "Top10", list: [DetailMovies(titleMovie: "Cobra", bannerMovie: "cobra.jpg"),
                                                                         DetailMovies(titleMovie: "Divertidamente", bannerMovie: "divertidamente"),
                                                                         DetailMovies(titleMovie: "Hulk", bannerMovie: "incrivel_hulk.jpg"),
                                                                         DetailMovies(titleMovie: "One Love", bannerMovie: "one_love.jpg"),
                                                                         DetailMovies(titleMovie: "Rocky4", bannerMovie: "rocky.jpg"),
                                                                         DetailMovies(titleMovie: "Sonic", bannerMovie: "sonic.jpg"),
                                                                         DetailMovies(titleMovie: "Homem Aranha", bannerMovie: "spiderman.jpg"),
                                                                         DetailMovies(titleMovie: "Tropa de Elite 2", bannerMovie: "tropa_elite_2.jpg"),
                                                                         DetailMovies(titleMovie: "De volta para o Futuro 2", bannerMovie: "volta_para_futuro.jpg"),
                                                                         DetailMovies(titleMovie: "Wolverine", bannerMovie: "wolverine.jpg"),]),
                                        Movies(category: "Assista agora", list: [DetailMovies(titleMovie: "Cobra", bannerMovie: "cobra.jpg"),
                                                                                                             DetailMovies(titleMovie: "Divertidamente", bannerMovie: "divertidamente"),
                                                                                                             DetailMovies(titleMovie: "Hulk", bannerMovie: "incrivel_hulk.jpg"),
                                                                                                             DetailMovies(titleMovie: "One Love", bannerMovie: "one_love.jpg"),
                                                                                                             DetailMovies(titleMovie: "Rocky4", bannerMovie: "rocky.jpg"),
                                                                                                             DetailMovies(titleMovie: "Sonic", bannerMovie: "sonic.jpg"),
                                                                                                             DetailMovies(titleMovie: "Homem Aranha", bannerMovie: "spiderman.jpg"),
                                                                                                             DetailMovies(titleMovie: "Tropa de Elite 2", bannerMovie: "tropa_elite_2.jpg"),
                                                                                                             DetailMovies(titleMovie: "De volta para o Futuro 2", bannerMovie: "volta_para_futuro.jpg"),
                                                                                                             DetailMovies(titleMovie: "Wolverine", bannerMovie: "wolverine.jpg"),])
    ]
    
    var numberOfRowsInSection: Int {
      return 2
    }

    func loadCurrentDetail(indexPath: IndexPath) -> Movies {
      return listMovies[indexPath.row]
    }
}
