//
//  SolidifyAppApp.swift
//  SolidifyApp
//
//  Created by Necati Akpınar on 21.10.2023.
//

import SwiftUI

@main
struct SolidifyAppApp: App {
    var userGames = UserGames(games: BaseGame.sampleData)
    var body: some Scene {
        WindowGroup {
            MainView(games: .constant(BaseGame.sampleData), userGames: userGames)
        }
    }
}


