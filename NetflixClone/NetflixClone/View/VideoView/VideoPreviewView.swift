//
//  VideoPreviewView.swift
//  NetflixClone
//
//  Created by Apple on 9/2/20.
//

import struct Kingfisher.KFImage
import SwiftUI

struct VideoPreviewView: View {
    var imageURL: URL
    var videoURL: URL
    @Binding var isShowPlayerView: Bool
    @Binding var videoURLSelected: URL?

    init(imageURL: URL, videoURL: URL, isShowPlayerView: Binding<Bool>) {
        self.imageURL = imageURL
        self.videoURL = videoURL
        self._isShowPlayerView = isShowPlayerView
        self._videoURLSelected = .constant(nil)
    }

    init(imageURL: URL, videoURL: URL, isShowPlayerView: Binding<Bool>, videoURLSelected: Binding<URL?>) {
        self.imageURL = imageURL
        self.videoURL = videoURL
        self._isShowPlayerView = isShowPlayerView
        self._videoURLSelected = videoURLSelected
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                KFImage(imageURL)
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .scaledToFill()

                Button(action: {
                    self.isShowPlayerView = true
                    self.videoURLSelected = videoURL
                }, label: {
                    Image(systemName: "play.circle")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                })
            }
        }
    }
}

struct VideoPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VideoPreviewView(imageURL: Trailer.example.thumbnailImageURL, videoURL: Trailer.example.movieURL, isShowPlayerView: .constant(false))
        }
    }
}
