//
//  ContentView.swift
//  SolidifyApp
//
//  Created by Necati Akpınar on 21.10.2023.
//

import SwiftUI

struct GamesView: View {
    @Binding var games : [BaseGame]
    var body: some View {
        NavigationStack {
            List($games) {
                $game in
                NavigationLink(destination: GameDetailView(game: $game))
                {
                    GameCardView(game: game)
                }
                .listRowBackground(Theme.ColorScheme.background.color)
            }
            .navigationTitle("Games")
        }
        
    }
    
}



#Preview {
    GamesView(games: .constant(BaseGame.sampleData))
}
