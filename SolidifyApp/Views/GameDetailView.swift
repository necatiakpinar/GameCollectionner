import SwiftUI
import Combine

struct GameDetailView: View {
    @Binding var game: BaseGame
    @ObservedObject var userGames: UserGames
    @State private var isAdded: Bool = false
    
    var body: some View {
        List {
            Section(header: Text("Definition")) {
                Text("\(game.name) is a great game bro")
                
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
    static var userGames = UserGames(games: BaseGame.sampleData, events: GameEvents())
    
    static var previews: some View {
        GameDetailView(game: .constant(BaseGame.sampleData[0]), userGames: userGames)
    }
}
