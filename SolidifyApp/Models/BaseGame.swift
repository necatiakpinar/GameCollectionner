import Foundation

class BaseGame: Identifiable
{
    let id: UUID
    let name: String
    let genre: Constants.GameGenre
    
    init(id: UUID = UUID(), name: String, genre: Constants.GameGenre) {
        self.id = id
        self.name = name
        self.genre = genre
    }
    
    
}

extension BaseGame {
    static let sampleData: [BaseGame] =
    [
        BaseGame(name: "The Last Of Us", genre: Constants.GameGenre.action),
        BaseGame(name: "Fifa 24", genre: Constants.GameGenre.sports),
        BaseGame(name: "World of Warcraft", genre: Constants.GameGenre.massivelyMultiplayerOnline),
        BaseGame(name: "Spider Man", genre: Constants.GameGenre.action),
        BaseGame(name: "Alan Wake 2", genre: Constants.GameGenre.horror),
        BaseGame(name: "NBA2K24", genre: Constants.GameGenre.sports),
        BaseGame(name: "Resident Evil 4", genre: Constants.GameGenre.horror),
    ]
    
    static let emptyData: [BaseGame] = []
}


extension BaseGame: Equatable {
    
    static func == (lhs: BaseGame, rhs: BaseGame) -> Bool {
        return lhs.id == rhs.id
    }
}
