//
//  MovieSession.swift
//  NetflixClone
//
//  Created by Apple on 9/2/20.
//

import Foundation

struct MovieSession: Codable, Equatable {
    static func == (lhs: MovieSession, rhs: MovieSession) -> Bool {
        return lhs.id == rhs.id
    }

    var id: String = UUID().uuidString
    var movieId: String
    var name: String
    var episodes: [Episode]

    static var example1: MovieSession {
        return MovieSession(id: "1", movieId: "1", name: "Session 1", episodes: [Episode.example1, Episode.example1, Episode.example1])
    }

    static var example2: MovieSession {
        return MovieSession(id: "2", movieId: "1", name: "Session 2", episodes: [Episode.example2, Episode.example2, Episode.example2])
    }

    static var example3: MovieSession {
        return MovieSession(id: "3", movieId: "1", name: "Session 3", episodes: [Episode.example3, Episode.example3, Episode.example3])
    }
}
