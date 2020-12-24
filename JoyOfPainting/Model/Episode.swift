//
//  Episode.swift
//  JoyOfPainting
//
//  Created by Janek Szynal on 24.12.20.
//

import Foundation
import SwiftUI

struct Episode {
    let title: String
    let seasonNumber: Int
    let episodeNumber: Int
    let imageName: String
    let youtubeVideoId: String

    var image: Image {
        Image(imageName)
    }

    var signature: String {
        "S" + String(seasonNumber) + "E" + String(episodeNumber)
    }

    var youtubeLink: String {
        get {
            "https://www.youtube.com/watch?v=" + youtubeVideoId
        }
    }
}
