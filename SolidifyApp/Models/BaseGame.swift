import Foundation

class BaseGame: Identifiable
{
    let id: UUID
    let name: String
    let genre: Constants.GameGenre
    let definition: String
    
    init(id: UUID = UUID(), name: String, genre: Constants.GameGenre, definition: String) {
        self.id = id
        self.name = name
        self.genre = genre
        self.definition = definition
    }
    
    
}

extension BaseGame {
    static let sampleData: [BaseGame] =
    [
        BaseGame(name: "The Last Of Us", genre: Constants.GameGenre.action, definition: "Last of us is a great game which has horror"),
        BaseGame(name: "Fifa 24", genre: Constants.GameGenre.sports, definition: "EA's football game fifa's new game!"),
        BaseGame(name: "World of Warcraft", genre: Constants.GameGenre.massivelyMultiplayerOnline, definition: "Blizzards"),
        BaseGame(name: "Spider Man", genre: Constants.GameGenre.action, definition:"Test Definition"),
        BaseGame(name: "Alan Wake 2", genre: Constants.GameGenre.horror, definition:"Test Definition"),
        BaseGame(name: "NBA2K24", genre: Constants.GameGenre.sports, definition:"Test Definition"),
        BaseGame(name: "Resident Evil 4", genre: Constants.GameGenre.horror, definition:"Test Definition"),
    ]
    
    static let emptyData: [BaseGame] = []
}


extension BaseGame: Equatable {
    
    static func == (lhs: BaseGame, rhs: BaseGame) -> Bool {
        return lhs.id == rhs.id
    }
}
