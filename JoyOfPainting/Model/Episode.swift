//
//  Episode.swift
//  JoyOfPainting
//
//  Created by Janek Szynal on 24.12.20.
//

import Foundation
import SwiftUI

struct Episode: Identifiable {
    let title: String
    let seasonNumber: Int
    let episodeNumber: Int
    let imageName: String
    let youtubeVideoId: String

    var image: Image { Image(imageName) }
    var id: String { "S" + String(seasonNumber) + "E" + String(episodeNumber)}
    var youtubeLink: URL {
        let youtubeAppURL =  URL(string: "youtube://" + youtubeVideoId)!
        if UIApplication.shared.canOpenURL(youtubeAppURL) {
            return youtubeAppURL
        } else {
            return URL(string: "https://www.youtube.com/v/\(youtubeVideoId)")!
        }
    }
}
