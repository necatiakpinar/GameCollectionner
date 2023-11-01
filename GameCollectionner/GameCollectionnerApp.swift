//
//  SolidifyAppApp.swift
//  SolidifyApp
//
//  Created by Necati Akpınar on 21.10.2023.
//

import SwiftUI

@main
struct GameCollectionnerApp: App {
    
    @ObservedObject var gameEvents = GameEvents()
    var userGames: UserGamesViewModel {
        return UserGamesViewModel(games: BaseGame.emptyData, events: gameEvents)
    }
    
    var gameComments = GameCommentViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView(games: .constant(BaseGame.sampleData), userGames: userGames, gameComments: gameComments, gameEvents: gameEvents)
        }
    }
}


