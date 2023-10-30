import SwiftUI

struct GameDetailDefinitionView: View {
    @Binding var game: BaseGame
    @ObservedObject var userGames: UserGamesViewModel
    @State private var isAdded: Bool = false
    
    var body: some View {
        Section(header: Text("Definition")) {
            Text("\(game.definition)")
            
            Button(action: {
                isAdded.toggle()
                if (isAdded) {
                    userGames.addGame(game: game)
                }
                else {
                    userGames.removeGame(game: game)
                }
                
            }) {
                HStack {
                    if isAdded {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                    }
                    
                    Text(isAdded ? "Added" : "Add to your collection")
                        .foregroundColor(isAdded ? .green : .blue)
                }
            }
        }
    }
}


struct GameDetailDefinitionView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        
        List {
            GameDetailDefinitionView(game: .constant(BaseGame.sampleData[0]), userGames: UserGamesViewModel(games: BaseGame.sampleData, events: GameEvents()))
        }
    }
}
