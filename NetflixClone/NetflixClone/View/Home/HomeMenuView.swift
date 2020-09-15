//
//  HomeMenuView.swift
//  NetflixClone
//
//  Created by Apple on 8/25/20.
//

import SwiftUI

struct HomeMenuView: View {
    var body: some View {
        HStack {
            Button(action: {
                print("Tap icon netflix")
            }, label: {
                Image("ic_netflix")
            })
            
            Spacer()

            Button(action: {
            }, label: {
                Text("TV Shows")
                    .font(.title3)
            })
            
            Spacer()

            Button(action: {
                print("Tap Movies")
            }, label: {
                Text("Movies")
                    .font(.title3)
            })
            
            Spacer()

            Button(action: {
                print("Tap My Lists")
            }, label: {
                Text("My Lists")
                    .font(.title3)
            })
        }
        .foregroundColor(.white)
        .padding(.horizontal)
    }
}

struct HomeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            HomeMenuView()
        }
    }
}
