//
//  JoyOfPaintingApp.swift
//  JoyOfPainting
//
//  Created by Janek Szynal on 22.12.20.
//

import SwiftUI

var canOpenYoutubeApp: Bool  = { () -> Bool in
    let youtubeURL = URL(string: "youtube://")!
    return  UIApplication.shared.canOpenURL(youtubeURL)
}()

@main
struct JoyOfPaintingApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
