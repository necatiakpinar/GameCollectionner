//
//  ContentView.swift
//  SolidifyApp
//
//  Created by Necati Akpınar on 21.10.2023.
//

import SwiftUI

struct MainView: View {
    @Binding var games: [BaseGame]
    @ObservedObject var userGames: UserGames
    
    var body: some View {
        NavigationView {
            TabView(selection: .constant(1)) {
                GamesView(games: $games)
                    .tabItem { Text("Home") }
                    .tag(1)
                
                UserGamesView(userGames: userGames)
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
        let newGame = BaseGame(name: "New Game \(games.count + 1)", genre: Constants.GameGenre.horror)
        userGames.addGame(game: newGame)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        
        let sampleUserGames = UserGames(games: BaseGame.sampleData)
        
        MainView(games: .constant(BaseGame.sampleData), userGames: sampleUserGames)
    }
}
