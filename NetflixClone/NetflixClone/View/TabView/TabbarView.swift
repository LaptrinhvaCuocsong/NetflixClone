//
//  TabbarView.swift
//  NetflixClone
//
//  Created by Apple on 9/6/20.
//

import SwiftUI

struct TabbarView: View {
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(1)
            
            Text("Coming soon")
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Coming soon")
                }
                .tag(2)
            
            Text("Downloads")
                .tabItem {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Downloads")
                }
                .tag(3)
            
            Text("More")
                .tabItem {
                    Image(systemName: "equal")
                    Text("More")
                }
                .tag(4)
        }
        .accentColor(.white)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
