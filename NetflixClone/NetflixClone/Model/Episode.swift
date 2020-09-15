//
//  Episode.swift
//  NetflixClone
//
//  Created by Apple on 8/27/20.
//

import Foundation

struct Episode: Codable {
    var id: String
    var name: String
    var session: Int
    var thumbnailImageURLString: String
    var description: String
    var length: Double

    var thumbnailImageURL: URL {
        return URL(string: thumbnailImageURLString)!
    }

    var videoURL: URL {
        let path = Bundle.main.path(forResource: "1", ofType: "mov")
        let url = URL(fileURLWithPath: path!)
        return url
    }

    static var example1: Episode {
        return Episode(id: "1", name: "Dark", session: 1, thumbnailImageURLString: "https://cdn.bongdaplus.vn/Assets/Media/2020/08/22/25/Elton.jpg", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", length: 120.0)
    }

    static var example2: Episode {
        return Episode(id: "2", name: "Chi Pheo", session: 2, thumbnailImageURLString: "https://cdn.bongdaplus.vn/Assets/Media/2020/08/22/25/Elton.jpg", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", length: 120.0)
    }

    static var example3: Episode {
        return Episode(id: "3", name: "Sieu Quay", session: 3, thumbnailImageURLString: "https://cdn.bongdaplus.vn/Assets/Media/2020/08/22/25/Elton.jpg", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", length: 120.0)
    }
}
