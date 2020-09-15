//
//  Movie.swift
//  NetflixClone
//
//  Created by Apple on 8/23/20.
//

import Foundation

struct Movie: Codable {
    var id: String
    var name: String
    var thumnailURL: URL
    var categories: [String]
    var year: Int
    var rating: String
    var numberOfSession: Int?
    var description: String
    var casts: [String]
    var currentSession: MovieSession
    var sessions: [MovieSession]

    var trailers: [Trailer] {
        [Trailer.example, Trailer.example, Trailer.example, Trailer.example]
    }

    var relateMovies: [Movie] {
        [Movie.example, Movie.example, Movie.example, Movie.example, Movie.example, Movie.example, Movie.example, Movie.example, Movie.example]
    }

    var numberOfSessionDisplay: String? {
        guard let numberOfSession = self.numberOfSession else {
            return nil
        }
        if numberOfSession == 1 {
            return "1 Session"
        } else {
            return "\(numberOfSession) Sessions"
        }
    }

    static var example: Movie {
        return Movie(id: "1", name: "Dark", thumnailURL: URL(string: "https://cdn.bongdaplus.vn/Assets/Media/2020/08/22/25/Elton.jpg")!, categories: ["Phim hài", "TV Show", "Phim hành động"], year: 2020, rating: "TV-MA", numberOfSession: 3, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", casts: ["Xuan Bac", "Tu Long", "Xuan Hinh"], currentSession: MovieSession.example1, sessions: [MovieSession.example1, MovieSession.example2, MovieSession.example3])
    }
}
