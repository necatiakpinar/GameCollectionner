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
    ]
}
