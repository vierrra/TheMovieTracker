//
//  HomeModel.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 25/08/24.
//

import Foundation

struct Movies {
    var category: String
    var list: [DetailMovies]
}

struct DetailMovies {
    var titleMovie: String
    var bannerMovie: String
}

