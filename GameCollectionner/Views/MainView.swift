//
//  ContentView.swift
//  SolidifyApp
//
//  Created by Necati Akpınar on 21.10.2023.
//

import SwiftUI

struct MainView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var games: [BaseGame]
    @ObservedObject var userGames: UserGamesViewModel
    @ObservedObject var gameComments: GameCommentViewModel
    
    var gameEvents: GameEvents
    @State private var activeTabIndex: Int = 1
    
    var body: some View {
        VStack {
            TabView(selection: $activeTabIndex) {
                GamesView(games: $games, userGames: userGames, gameComments: gameComments, selectedTabIndex: $activeTabIndex)
                    .tabItem { Text("Home") }
                    .tag(1)
                
                UserGamesView(userGames: userGames, gameComments: gameComments, selectedTabIndex: $activeTabIndex)
                    .tabItem { Text("My Games") }
                    .tag(2)            

            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: addGame) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    func addGame() {
        let newGame = BaseGame(name: "New Game \(games.count + 1)", genre: Constants.GameGenre.horror, definition: "Test Definition")
        userGames.addGame(game: newGame)
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var gameEvents = GameEvents()
        var userGames: UserGamesViewModel {
            return UserGamesViewModel(games: BaseGame.emptyData, events: gameEvents)
        }
        let gameComments = GameCommentViewModel()
        
        MainView(games: .constant(BaseGame.sampleData), userGames: userGames, gameComments: gameComments,  gameEvents: GameEvents())
    }
}

