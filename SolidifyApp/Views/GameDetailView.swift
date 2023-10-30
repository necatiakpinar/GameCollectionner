import SwiftUI
import Combine

struct GameDetailView: View {
    @Binding var game: BaseGame
    @ObservedObject var userGames: UserGamesViewModel
    @ObservedObject var gameComments: GameCommentViewModel
    @State private var isAdded: Bool = false
    
    var body: some View {
        List {
            GameDetailDefinitionView(game: $game, userGames: userGames)
            GameDetailCommentsView(game: $game, gameComments: gameComments)
            
        }
        .onAppear {
            if userGames.hasGame(game: game) {
                isAdded = true
            }
        }
        .buttonStyle(PlainButtonStyle())
        .navigationTitle(game.name)
        
    }
    
}


struct GameDetailView_PreviewProvider: PreviewProvider
{
    static var userGames = UserGamesViewModel(games: BaseGame.sampleData, events: GameEvents())
    
    static var previews: some View {
        GameDetailView(game: .constant(BaseGame.sampleData[0]), userGames: userGames, gameComments: GameCommentViewModel())
    }
}
