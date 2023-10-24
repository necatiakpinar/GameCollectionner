import SwiftUI

struct UserGamesView: View {
    @ObservedObject var userGames: UserGames
    var body: some View {
        NavigationStack {
            List($userGames.games) {
                $game in
                NavigationLink(destination: GameDetailView(game: $game))
                {
                    GameCardView(game: game)
                }
                
            }
            .navigationTitle("Games")
        }
    }
}

#Preview {
    UserGamesView(userGames: (UserGames(games: BaseGame.sampleData)))
}


