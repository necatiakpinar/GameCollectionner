import Foundation

class GameCommentViewModel: ObservableObject {
    @Published var comments: [UUID: [String]] = [:]

    func addComment(gameID: UUID, comment: String) {
        let gameExist = comments.keys.contains(gameID)
        
        if gameExist {
            comments[gameID]?.append(comment)
            print("Comment is added")
        } else {
            let commentList = [comment]
            comments[gameID] = commentList
            print("New game has been added into dictionary with new list of comments")
        }
    }
    func removeComment(gameID: UUID, comment: String) {
        let gameExist = comments.keys.contains(gameID)
        
        if gameExist {
            if let index = comments[gameID]?.firstIndex(of: comment) {
                comments[gameID]?.remove(at: index)
                print("\(comment) has been REMOVED to your collection!")
            }

        } else {
            let commentList = [comment]
            comments[gameID] = commentList
            print("New game has been added into dictionary with new list of comments")
        }
    }
}
