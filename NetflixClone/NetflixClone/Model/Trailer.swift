//
//  Trailer.swift
//  NetflixClone
//
//  Created by Apple on 9/2/20.
//

import Foundation

struct Trailer: Codable {
    var id: String = UUID().uuidString
    var name: String

    var thumbnailImageURL: URL {
        return URL(string: "https://cdn.bongdaplus.vn/Assets/Media/2020/08/22/25/Elton.jpg")!
    }

    var movieURL: URL {
        let path = Bundle.main.path(forResource: "1", ofType: "mov")
        let url = URL(fileURLWithPath: path!)
        return url
    }
    
    static var example: Trailer {
        return Trailer(name: "Có con chim nho nhỏ")
    }
}
