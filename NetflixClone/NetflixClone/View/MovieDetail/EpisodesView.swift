//
//  EpisodesView.swift
//  NetflixClone
//
//  Created by Apple on 9/2/20.
//

import SwiftUI

struct EpisodesView: View {
    @State var movie: Movie

    @State private var isShowSessionPicker = false
    @State private var isShowPlayerView = false
    @State private var videoURLSelected: URL?

    private var sessionNames: [String] {
        movie.sessions.map { $0.name }
    }

    var body: some View {
        let selectedSessionIndex = Binding<Int> {
            movie.sessions.firstIndex(where: { $0 == movie.currentSession }) ?? 0
        } set: { newValue in
            movie.currentSession = movie.sessions[newValue]
        }

        let videoURLSelectedBinding = Binding<URL?> {
            videoURLSelected
        } set: { newValue in
            videoURLSelected = newValue
        }

        return VStack(spacing: 30) {
            HStack {
                Button(action: {
                    self.isShowSessionPicker = true
                }, label: {
                    HStack {
                        Text(movie.currentSession.name)
                            .font(.headline)
                        Image(systemName: "chevron.down")
                    }
                })
                    .sheet(isPresented: $isShowSessionPicker) {
                        CustomPickerView(values: sessionNames, selectedIndex: selectedSessionIndex, isShowPickerView: $isShowSessionPicker)
                    }
                Spacer()
            }

            VStack(spacing: 22) {
                let episodes = movie.sessions[selectedSessionIndex.wrappedValue].episodes

                ForEach(0 ..< episodes.count) { index in
                    EpisodeView(index: index + 1, episode: episodes[index], isShowPlayerView: $isShowPlayerView, videoURLSelected: videoURLSelectedBinding)
                        .sheet(isPresented: $isShowPlayerView) {
                            if let url = videoURLSelected {
                                PlayerView(url: url)
                            }
                        }
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            EpisodesView(movie: .example)
        }
    }
}
