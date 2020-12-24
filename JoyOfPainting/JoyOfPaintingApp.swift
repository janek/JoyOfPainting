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
            let text = try String(contentsOfFile: path!)
            print(text)
        } catch {
            print("error")
        }

    }
}
