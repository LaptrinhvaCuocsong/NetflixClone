//
//  HomeView.swift
//  NetflixClone
//
//  Created by Apple on 8/22/20.
//

import struct Kingfisher.KFImage
import SwiftUI

struct HomeView: View {
    private let viewModel = HomeVM()

    @State private var isShowMovieDetail = false
    @State private var movieDetailToShow: Movie? = nil
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black
                .edgesIgnoringSafeArea(.all)

            ScrollView(.vertical, showsIndicators: false) {
                TopHomePreview(movie: Movie.example)
                    .frame(height: 0.6 * UIScreen.main.bounds.height)

                LazyVStack {
                    ForEach(viewModel.movies.map { $0.key }, id: \.self) { key in
                        VStack(alignment: .leading, spacing: 12) {
                            Text(key)
                                .font(.title3)
                                .bold()
                            let movies = self.viewModel.movies[key] ?? []
                            if !movies.isEmpty {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(0 ..< movies.count) { index in
                                            Button(action: {
                                                withAnimation(.easeOut) {
                                                    self.movieDetailToShow = movies[index]
                                                    self.isShowMovieDetail = true
                                                }
                                            }, label: {
                                                StandardHomeView(movie: movies[index])
                                                    .frame(width: 140, height: 160)
                                            })
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.bottom)
                    }
                    .padding(.horizontal)
                }
            }
            .edgesIgnoringSafeArea(.all)

            HomeMenuView()
            
            if movieDetailToShow != nil && isShowMovieDetail {
                MovieDetailView(movie: movieDetailToShow!, isShowMovieDetail: $isShowMovieDetail)
                    .transition(.identity)
            }
        }
        .preferredColorScheme(.light)
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
