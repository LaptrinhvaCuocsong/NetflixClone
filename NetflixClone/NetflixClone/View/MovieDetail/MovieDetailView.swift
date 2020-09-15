//
//  MovieDetailView.swift
//  NetflixClone
//
//  Created by Apple on 8/27/20.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    @Binding var isShowMovieDetail: Bool

    private let screen = UIScreen.main.bounds

    var body: some View {
        ZStack(alignment: .top) {
            Color.black
                .edgesIgnoringSafeArea(.all)

            ScrollView(showsIndicators: false) {
                ZStack(alignment: .top) {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray.opacity(0.1)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: screen.width, height: 350)
                        .blur(radius: 20)

                    MovieHeaderView(movie: movie)
                }

                MovieDetailTab(movie: movie)
                    .padding(.top, 20)
            }
            .padding(.horizontal, 24)
            .offset(x: 0, y: 40)

            HStack {
                Spacer()
                Button(action: {
                    self.isShowMovieDetail = false
                }, label: {
                    Image(systemName: "xmark.circle")
                        .font(.title)
                })
                    .padding(.trailing, 24)
            }
        }
        .foregroundColor(.white)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .example, isShowMovieDetail: .constant(true))
    }
}
