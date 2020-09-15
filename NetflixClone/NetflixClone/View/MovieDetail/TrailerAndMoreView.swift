//
//  TrailerAndMoreView.swift
//  NetflixClone
//
//  Created by Apple on 9/2/20.
//

import SwiftUI

struct TrailerAndMoreView: View {
    var trailers: [Trailer]

    @State var isShowPlayerView = false
    @State var videoURLSelected: URL?

    var body: some View {
        let videoURLSelectedBinding = Binding<URL?> {
            videoURLSelected
        } set: { newValue in
            videoURLSelected = newValue
        }

        return VStack {
            ForEach(0 ..< trailers.count) { index in
                let trailer = self.trailers[index]
                VStack(alignment: .leading, spacing: 12) {
                    VideoPreviewView(imageURL: trailer.thumbnailImageURL, videoURL: trailer.movieURL, isShowPlayerView: $isShowPlayerView, videoURLSelected: videoURLSelectedBinding)
                        .frame(height: 220)
                    Text(trailer.name)
                        .font(.headline)
                        .padding(.horizontal, 16)
                }
            }
        }
        .foregroundColor(.white)
        .sheet(isPresented: $isShowPlayerView) {
            if let url = videoURLSelected {
                PlayerView(url: url)
            }
        }
    }
}

struct TrailerAndMoreView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            TrailerAndMoreView(trailers: Movie.example.trailers)
        }
    }
}
