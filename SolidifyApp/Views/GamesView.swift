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
        VStack {
            
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
            TabView(selection: .constant(1), //Which tab is active, it shows that
                    content:  {
                Text("Tab Content 1").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }.tag(1)
                Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(2)
            })
            
            
        }
        
        
        
    }
}


#Preview {
    GamesView(games: .constant(BaseGame.sampleData))
}
