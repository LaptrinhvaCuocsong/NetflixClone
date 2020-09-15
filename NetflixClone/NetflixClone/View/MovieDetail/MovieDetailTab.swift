//
//  MovieDetailTab.swift
//  NetflixClone
//
//  Created by Apple on 8/30/20.
//

import SwiftUI

extension MovieDetailTab {
    enum CustomTabbar: String, CaseIterable {
        case episodes = "EPISODES"
        case trailerAndMore = "TRAILER & MORE"
        case moreLikeThis = "MORE LIKE THIS"
    }
}

struct MovieDetailTab: View {
    var movie: Movie
    
    private let tabbars = CustomTabbar.allCases
    @State private var activeTabbar: CustomTabbar = .episodes

    var body: some View {
        VStack(spacing: 20) {
            MovieDetailMenuView(tabbars: tabbars, activeTabbar: $activeTabbar)
            switch activeTabbar {
            case .episodes:
                EpisodesView(movie: movie)
            case .trailerAndMore:
                TrailerAndMoreView(trailers: Movie.example.trailers)
            case .moreLikeThis:
                MoreLikeThisView(movies: movie.relateMovies)
            }
        }
    }
}

struct MovieDetailTab_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            MovieDetailTab(movie: .example)
        }
    }
}
