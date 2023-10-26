import Combine

class GameEvents: ObservableObject {
    let gameAdded = PassthroughSubject<BaseGame,Never>()
    let gameRemoved = PassthroughSubject<BaseGame,Never>()
    let checkIfGameIsAdded = PassthroughSubject<BaseGame, Never>()  
    let isGameAddedResponse = CurrentValueSubject<(BaseGame, Bool), Never>((BaseGame(name: "null", genre: Constants.GameGenre.action), false))
    
}
