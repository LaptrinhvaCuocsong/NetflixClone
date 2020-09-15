//
//  MoreLikeThisView.swift
//  NetflixClone
//
//  Created by Apple on 9/2/20.
//

import SwiftUI
import struct Kingfisher.KFImage

struct MoreLikeThisView: View {
    var movies: [Movie]
    
    private let columns = 3
    private var rows: Int {
        if movies.count % columns == 0 {
            return movies.count / columns
        } else {
            return movies.count / columns + 1
        }
    }
    
    var body: some View {
        LazyVStack(spacing: 20) {
            ForEach(0 ..< rows) { row in
                HStack(spacing: 10) {
                    ForEach(0 ..< 3) { column in
                        Button(action: {
                            print("Cell Tapped")
                        }, label: {
                            KFImage(movies[row * self.columns + column].thumnailURL)
                                .resizable()
                                .frame(height: 200)
                        })
                    }
                }
            }
        }
    }
}

struct MoreLikeThisView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            MoreLikeThisView(movies: Movie.example.relateMovies)
        }
    }
}
