//
//  SearchView.swift
//  NetflixClone
//
//  Created by Apple on 9/10/20.
//

import SwiftUI

struct SearchView: View {
    @State private var searchBarBecomeFirstResponder = false
    
    private let screen = UIScreen.main.bounds

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            VStack {
                SearchBarView(becomeFirstResponder: $searchBarBecomeFirstResponder)
                    .padding(.horizontal, 16)
                    .frame(height: 50)

                ScrollView {
                }

                Spacer()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .onAppear {
            searchBarBecomeFirstResponder = true
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
