//
//  HomeModel.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 25/08/24.
//

import Foundation

struct Movies {
    var category: String
    var isSelected: Bool = false
    var list: [DetailMovies]
}

struct DetailMovies {
    var titleMovie: String
    var bannerMovie: String
}

