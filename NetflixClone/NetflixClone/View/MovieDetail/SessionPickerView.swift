//
//  SessionPickerView.swift
//  NetflixClone
//
//  Created by Apple on 9/2/20.
//

import Introspect
import SwiftUI

class SessionPickerObservable: ObservableObject {
    @Published var selectedIndex = 0

    func setSelectedIndex(_ index: Int) {
        selectedIndex = index
    }
}

struct SessionPickerView: View {
    var sessions: [MovieSession]
    @Binding var selectedSession: MovieSession

    @Environment(\.presentationMode) var presentation

    @ObservedObject private var observed = SessionPickerObservable()
    private let screen = UIScreen.main.bounds

    var body: some View {
        return NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)

                Picker("", selection: $observed.selectedIndex) {
                    ForEach(0 ..< sessions.count) { index in
                        let isSelected = observed.selectedIndex == index
                        Text(sessions[index].name)
                            .font(isSelected ? .title2 : .title3)
                            .foregroundColor(isSelected ? .white : .gray)
                    }
                }
            }
            .navigationBarItems(trailing: {
                HStack {
                    Spacer()
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.title)
                            .foregroundColor(.white)
                    })
                        .padding(.trailing, 24)
                }
            }())
        }
        .onAppear {
            let selectedIndex = sessions.firstIndex(where: { $0 == selectedSession }) ?? 0
            observed.setSelectedIndex(selectedIndex)
        }
        .onDisappear {
            selectedSession = sessions[observed.selectedIndex]
        }
    }
}

struct SessionPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SessionPickerView(sessions: Movie.example.sessions, selectedSession: .constant(MovieSession.example1))
    }
}
