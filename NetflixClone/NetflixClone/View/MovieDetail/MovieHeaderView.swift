//
//  MovieHeaderView.swift
//  NetflixClone
//
//  Created by Apple on 8/27/20.
//

import struct Kingfisher.KFImage
import SwiftUI

struct MovieHeaderView: View {
    var movie: Movie

    private let screen = UIScreen.main.bounds

    var body: some View {
        VStack(spacing: 22) {
            KFImage(movie.thumnailURL)
                .resizable()
                .frame(width: 180, height: 200)

            HStack(spacing: 22) {
                Button(action: {
                    print("Tap like button")
                }, label: {
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundColor(.white)
                })
                Text(String(movie.year))
                Text(movie.rating)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.gray)
                    .foregroundColor(.white)
                if movie.numberOfSessionDisplay != nil {
                    Text(movie.numberOfSessionDisplay!)
                        .foregroundColor(.white)
                }
            }
            .foregroundColor(.gray)

            if movie.numberOfSession != nil {
                Text("Watch session \(movie.numberOfSession!) now")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
            }

            Button(action: {
                print("Tap button play")
            }, label: {
                HStack {
                    Image(systemName: "play.fill")
                    Text("Play")
                }
                .frame(width: screen.width - 48, height: 40)
                .font(.title3)
                .foregroundColor(.white)
                .background(Color.red)
            })

            Text(movie.description)
                .foregroundColor(.white)
                .font(.subheadline)

            if !movie.casts.isEmpty {
                HStack {
                    Text("Casts: \(movie.casts.joined(separator: ", "))")
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            
            HStack(spacing: 40) {
                Button(action: {
                    print("Tap My List Button")
                }, label: {
                    VStack(spacing: 6) {
                        Image(systemName: "plus")
                            .font(.title)
                        Text("My List")
                    }
                })
                Button(action: {
                    print("Tap Rate")
                }, label: {
                    VStack(spacing: 6) {
                        Image(systemName: "hand.thumbsup.fill")
                            .font(.title)
                        Text("My List")
                    }
                })
                Button(action: {
                    print("Tap My List Button")
                }, label: {
                    VStack(spacing: 6) {
                        Image(systemName: "paperplane.fill")
                            .font(.title)
                        Text("My List")
                    }
                })
                
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.leading, 6)
        }
    }
}

struct MovieHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            MovieHeaderView(movie: Movie.example)
        }
    }
}
