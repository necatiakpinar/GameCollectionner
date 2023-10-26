import Foundation
import Combine

class UserGames: ObservableObject {
    @Published var games: [BaseGame] = []
    var cancellables: Set<AnyCancellable> = []
    
    init(games: [BaseGame], events: GameEvents) {
        self.games = games
        events.gameAdded.sink { [weak self] game in
            self?.addGame(game: game)
        }
        .store(in: &cancellables)
        
        events.gameRemoved.sink { [weak self] game in
            self?.removeGame(game: game)}
        .store(in: &cancellables)
        
        events.checkIfGameIsAdded
            .sink { [weak self] game in
                let exists = self?.hasGame(game: game) ?? false
                events.isGameAddedResponse.send((game, exists))
            }
            .store(in: &cancellables)
        
    }
    
    func addGame(game: BaseGame)
    {
        if (games.contains(game)) {
            return
        }
        
        games.append(game)
        print("\(game.name) has been ADDED to your collection!")
        
    }
    
    func removeGame(game: BaseGame) {
        if let index = games.firstIndex(of: game) {
            games.remove(at: index)
            print("\(game.name) has been REMOVED to your collection!")
        }
    }
    
    func hasGame(game: BaseGame) -> Bool {
        return games.contains(game)
    }
    
}


