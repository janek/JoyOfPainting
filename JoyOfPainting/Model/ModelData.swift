//
//  ModelData.swift
//  JoyOfPainting
//
//  Created by Janek Szynal on 24.12.20.
//

import Foundation

var episodes: [Episode] = load("episodes_final.csv")!

func load(_ filename: String) -> [Episode]? {
    do {
        let path = Bundle.main.path(forResource: "episodes_final", ofType: "csv")
        // XXX: How do we want to handle the file not being there?
        let data = try String(contentsOfFile: path!)
        var episodes = [Episode]()
        data.enumerateLines { (line, _) in
            let csvValues = line.split(separator: ",")

            //XXX: sanitize data better (they should either have no extensions, or at least the right one (png)
            let imgName = String(csvValues[5])
                .replacingOccurrences(of: ".png", with: "")
                .replacingOccurrences(of: ".jpg", with: "")


            let episode = Episode(title: String(csvValues[0]),
                                 seasonNumber: Int(csvValues[4])!,
                                 episodeNumber: Int(csvValues[3])!,
                                 imageName: imgName,
                                 youtubeVideoId: String(csvValues[1]))
            print(String(csvValues[5]))
            print("imageName: " + imgName)
            episodes.append(episode)
        }
        return episodes
    } catch {
        print("Error occured when initializing from CSV")
        return nil
    }
}

