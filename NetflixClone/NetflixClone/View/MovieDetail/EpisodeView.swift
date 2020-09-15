//
//  EpisodeView.swift
//  NetflixClone
//
//  Created by Apple on 9/2/20.
//

import SwiftUI

struct EpisodeView: View {
    var index: Int
    var episode: Episode
    @Binding var isShowPlayerView: Bool
    @Binding var videoURLSelected: URL?

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VideoPreviewView(imageURL: episode.thumbnailImageURL, videoURL: episode.videoURL, isShowPlayerView: $isShowPlayerView, videoURLSelected: $videoURLSelected)
                    .frame(width: 120, height: 120)
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(index). \(episode.name)")
                        .font(.headline)
                    Text("\(episode.length, specifier: "%.2f") m")
                        .font(.headline)
                }
                .padding(.horizontal, 12)
                Spacer()
                Button(action: {
                    print("Download Tapped")
                }, label: {
                    Image(systemName: "square.and.arrow.down")
                        .font(.system(size: 32))
                })
            }
            Text(episode.description)
                .lineLimit(3)
        }
        .foregroundColor(.white)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            EpisodeView(index: 1, episode: .example1, isShowPlayerView: .constant(false), videoURLSelected: .constant(nil))
        }
    }
}
