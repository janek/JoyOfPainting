//
//  EpisodeCell.swift
//  JoyOfPainting
//
//  Created by Janek Szynal on 24.12.20.
//

import SwiftUI

struct EpisodeCell: View {
    var episode: Episode
    var body: some View {
        HStack {
            episode.image
                .resizable()
                .frame(width: 150, height: 112)
            Text(episode.title)
            Link("↗", destination: episode.youtubeLink)
        }

        Spacer()
    }
}

struct EpisodeCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EpisodeCell(episode: episodes[0])
                .frame(width: 300.0, height: 300.0)
            EpisodeCell(episode: episodes[1])
                .frame(width: 300.0, height: 300.0)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
