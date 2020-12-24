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
                .frame(width: 450, height: 337)
            Text(episode.title)
        }

        Spacer()
    }
}

struct EpisodeCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EpisodeCell(episode: episodes[0])
                .frame(width: 100.0, height: 100.0)
            EpisodeCell(episode: episodes[1])
                .frame(width: 100.0, height: 100.0)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
