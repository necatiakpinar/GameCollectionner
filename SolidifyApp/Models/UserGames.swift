import Foundation

class UserGames: ObservableObject {
    @Published var games: [BaseGame] = []
    
    init(games: [BaseGame]) {
        self.games = games
    }
    
    func addGame(game: BaseGame)
    {
        games.append(game)
    }
    
    func removeGame(at index: Int)
    {
        games.remove(at: index)
    }
}


