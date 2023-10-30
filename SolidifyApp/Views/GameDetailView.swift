import SwiftUI
import Combine

struct GameDetailView: View {
    @Binding var game: BaseGame
    @ObservedObject var userGames: UserGamesViewModel
    @ObservedObject var gameComments: GameCommentViewModel
    @State private var isAdded: Bool = false
    @State private var enteredText: String = ""
    var body: some View {
        List {
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
            Section(header: Text("Comments")) {
                VStack{
                    if let gameCommentsForThisGame = gameComments.comments[game.id] {
                        ForEach(gameCommentsForThisGame, id: \.self) { comment in
                            GameCommentView(comment: comment, gameID: game.id, gameComments: gameComments)
                        }
                    }
                    
                }
                
                HStack{
                    TextField("Enter Comment...", text: $enteredText, onCommit: {
                        handleCommentEnter()
            
                    })
                    Button(action: {
                        handleCommentEnter()
                    }) {
                        Text("Add Comment")
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
    
    func handleCommentEnter() {
        gameComments.addComment(gameID: game.id, comment: enteredText)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            enteredText = ""
        }	
    }
    
}


struct GameDetailView_PreviewProvider: PreviewProvider
{
    static var userGames = UserGamesViewModel(games: BaseGame.sampleData, events: GameEvents())
    
    static var previews: some View {
        GameDetailView(game: .constant(BaseGame.sampleData[0]), userGames: userGames, gameComments: GameCommentViewModel())
    }
}
