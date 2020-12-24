//
//  JoyOfPaintingApp.swift
//  JoyOfPainting
//
//  Created by Janek Szynal on 22.12.20.
//

import SwiftUI

@main
struct JoyOfPaintingApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }

    init() {
        initDataFromCSV()
    }

    func initDataFromCSV() {
        do {
            let path = Bundle.main.path(forResource: "episodes_final", ofType: "csv")
            // XXX: How do we want to handle the file not being there?
            let data = try String(contentsOfFile: path!)
            var episodes = [Episode]()

            data.enumerateLines { (line, _) in
                let csvValues = line.split(separator: ",")
                let episode = Episode(title: String(csvValues[0]),
                                     seasonNumber: Int(csvValues[4])!,
                                     episodeNumber: Int(csvValues[3])!,
                                     imageFileName: String(csvValues[5]),
                                     youtubeVideoId: String(csvValues[1]))
                episodes.append(episode)
            }
        } catch {
            print("Error occured when initializing from CSV")
        }

    }
}
