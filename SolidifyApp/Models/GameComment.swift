import Foundation

class GameComment: Identifiable {
    let id: UUID
    let comment: String
    

    init(id: UUID, comment: String) {
        self.id = id
        self.comment = comment
    }
}


extension GameComment: Equatable {
    
    static func == (lhs: GameComment, rhs: GameComment) -> Bool {
        return lhs.id == rhs.id
    }
}
