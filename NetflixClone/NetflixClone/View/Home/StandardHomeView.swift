//
//  StandardHomeView.swift
//  NetflixClone
//
//  Created by Apple on 8/23/20.
//

import struct Kingfisher.KFImage
import SwiftUI

struct StandardHomeView: View {
    var movie: Movie

    var body: some View {
        KFImage(movie.thumnailURL)
            .resizable()
            .cornerRadius(8)
    }
}

struct StandardHomeView_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeView(movie: Movie.example)
    }
}
