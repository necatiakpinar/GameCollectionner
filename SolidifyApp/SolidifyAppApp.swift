//
//  SolidifyAppApp.swift
//  SolidifyApp
//
//  Created by Necati Akpınar on 21.10.2023.
//

import SwiftUI

@main
struct SolidifyAppApp: App {
    @ObservedObject var gameEvents = GameEvents()
    var userGames: UserGames {
        return UserGames(games: BaseGame.emptyData, events: gameEvents)
    }
    var body: some Scene {
        WindowGroup {
            MainView(games: .constant(BaseGame.sampleData), userGames: userGames, gameEvents: gameEvents)
        }
    }
}


