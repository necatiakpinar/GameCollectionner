//
//  SolidifyAppApp.swift
//  SolidifyApp
//
//  Created by Necati Akpınar on 21.10.2023.
//

import SwiftUI

@main
struct SolidifyAppApp: App {
    var body: some Scene {
        WindowGroup {
            GamesView(games: .constant(BaseGame.sampleData))
        }
    }
}
