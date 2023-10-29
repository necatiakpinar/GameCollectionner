//
//  ContentView.swift
//  SolidifyApp
//
//  Created by Necati Akpınar on 21.10.2023.
//

import SwiftUI

struct GamesView: View {
    @Binding var games: [BaseGame]
    var userGames: UserGamesViewModel
    var gameComments: GameCommentViewModel
    @State private var selectedGame: BaseGame?
    @Binding var selectedTabIndex: Int
    let tabIndex = 1
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(games) { game in
                    Button(action: {
                        selectedGame = game
                    }) {
                        GameCardView(game: game)
                    }
                    .background(
                        NavigationLink("", destination: GameDetailView(game: .constant(game), userGames: userGames, gameComments: gameComments), isActive: Binding(
                            get: { selectedGame == game },
                            set: { newValue in
                                if !newValue {
                                    selectedGame = nil
                                }
                            }
                        ))

                    )
                }
            }
            .navigationTitle("Games")
        }
        .onAppear {
            selectedTabIndex = tabIndex
        }
        .onChange(of: selectedTabIndex) { newValue in
            if newValue != tabIndex {
                print("tab degisti")
                selectedGame = nil
            }
        }


    }
}


struct GamesView_PreviewProvider: PreviewProvider {
    static var userGames = UserGamesViewModel(games: BaseGame.sampleData, events: GameEvents())
    
    static var previews: some View {
        GamesView(games: .constant(BaseGame.sampleData), userGames: userGames, gameComments: GameCommentViewModel(), selectedTabIndex: .constant(1))
    }
}


