//
//  Episode.swift
//  JoyOfPainting
//
//  Created by Janek Szynal on 24.12.20.
//

import Foundation

struct Episode {
    let title: String
    let seasonNumber: Int
    let episodeNumber: Int
    let imageFileName: String
    let youtubeVideoId: String

    var signature: String {
        get {
            "S" + String(seasonNumber) + "E" + String(episodeNumber)
        }
    }

    var youtubeLink: String {
        get {
            "https://www.youtube.com/watch?v=" + youtubeVideoId
        }
    }
}
