//
//  HomeVM.swift
//  NetflixClone
//
//  Created by Apple on 8/23/20.
//

import Foundation
import SwiftUI

class HomeVM: ObservableObject {
    @Published var movies: [String: [Movie]] = [:]

    init() {
        setupMovies()
    }
    
    private func setupMovies() {
        movies["Trending Now"] = [Movie.example, Movie.example, Movie.example, Movie.example, Movie.example, Movie.example]
        movies["Continue Watching"] = [Movie.example, Movie.example, Movie.example, Movie.example, Movie.example, Movie.example]
        movies["Top 10 Viet Nam"] = [Movie.example, Movie.example, Movie.example, Movie.example, Movie.example, Movie.example]
        movies["Classic"] = [Movie.example, Movie.example, Movie.example, Movie.example, Movie.example, Movie.example]
        movies["Legend"] = [Movie.example, Movie.example, Movie.example, Movie.example, Movie.example, Movie.example]
    }
}
