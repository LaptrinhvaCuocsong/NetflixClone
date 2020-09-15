//
//  TopHomePreview.swift
//  NetflixClone
//
//  Created by Apple on 8/23/20.
//

import struct Kingfisher.KFImage
import SwiftUI

struct TopHomePreview: View {
    var movie: Movie

    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(movie.thumnailURL)
                .resizable()
            
            LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.95)]),
                           startPoint: .top,
                           endPoint: .bottom)
                .padding(.top, 250)

            VStack(spacing: 16) {
                HStack {
                    ForEach(0 ..< movie.categories.count, id: \.self) { index in
                        HStack {
                            Text(self.movie.categories[index])
                                .font(.system(size: 18))
                                .bold()
                            if index < self.movie.categories.count - 1 {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 4))
                                    .foregroundColor(.green)
                            }
                        }
                    }
                }
                HStack(spacing: 40) {
                    Button(action: {
                        print("Tap My List")
                    }, label: {
                        VStack(spacing: 4) {
                            Image(systemName: "checkmark")
                                .font(.title)
                            Text("My List")
                                .font(.subheadline)
                        }
                    })

                    Button(action: {
                        print("Tap Play")
                    }, label: {
                        HStack(spacing: 12) {
                            Image(systemName: "play.fill")
                                .font(.title)
                                .foregroundColor(.black)
                            Text("Play")
                                .font(.system(size: 16))
                                .bold()
                                .foregroundColor(.black)
                        }
                        .frame(width: 140, height: 40)
                        .background(Color.white)
                        .cornerRadius(4)
                    })

                    Button(action: {
                        print("Tap Info Button")
                    }, label: {
                        VStack(spacing: 4) {
                            Image(systemName: "info.circle")
                                .font(.title)
                            Text("Info")
                                .font(.subheadline)
                        }
                    })
                }
            }
            .padding(.bottom, 20)
        }
        .foregroundColor(.white)
    }
}

struct TopHomePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopHomePreview(movie: Movie.example)
            .edgesIgnoringSafeArea(.all)
    }
}
