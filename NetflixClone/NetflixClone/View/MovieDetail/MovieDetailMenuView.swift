//
//  MovieDetailMenuView.swift
//  NetflixClone
//
//  Created by Apple on 8/29/20.
//

import SwiftUI

struct MovieDetailMenuButton: View {
    var tabbar: MovieDetailTab.CustomTabbar
    @Binding var activeTabbar: MovieDetailTab.CustomTabbar

    var width: CGFloat {
        NSAttributedString(string: tabbar.rawValue)
            .font(UIFont.systemFont(ofSize: 18, weight: .bold))
            .getWidth(maxHeight: .infinity)
    }

    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 3)
                .fill(Color.red)
                .frame(width: activeTabbar == tabbar ? width : 0, height: 6)

            Button(action: {
                withAnimation(.easeOut) {
                    self.activeTabbar = self.tabbar
                }
            }, label: {
                Text(tabbar.rawValue)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
            })
        }
    }
}

struct MovieDetailMenuView: View {
    var tabbars: [MovieDetailTab.CustomTabbar]
    @Binding var activeTabbar: MovieDetailTab.CustomTabbar

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(tabbars, id: \.self) { tabbar in
                    MovieDetailMenuButton(tabbar: tabbar, activeTabbar: $activeTabbar)
                }
            }
        }
    }
}
