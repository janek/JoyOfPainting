//
//  EpisodeList.swift
//  JoyOfPainting
//
//  Created by Janek Szynal on 24.12.20.
//

import SwiftUI

struct EpisodeList: View {
    var body: some View {
        NavigationView {
            List(episodes) { episode in
                NavigationLink(destination: nil) {
                    EpisodeCell(episode: episode)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct EpisodeList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            EpisodeList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
