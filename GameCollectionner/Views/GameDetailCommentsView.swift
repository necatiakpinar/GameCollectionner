import SwiftUI

struct GameDetailCommentsView: View {
    @Binding var game: BaseGame
    @ObservedObject var gameComments: GameCommentViewModel
    @State private var enteredText: String = ""
    
    var body: some View {
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
    
    func handleCommentEnter() {
        gameComments.addComment(gameID: game.id, comment: enteredText)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            enteredText = ""
        }
    }
}
