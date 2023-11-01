import SwiftUI

struct UserGamesView: View {
    @StateObject var userGames: UserGamesViewModel
    var gameComments: GameCommentViewModel
    
    @State private var selectedGame: BaseGame?
    @Binding var selectedTabIndex: Int
    let tabIndex = 2
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Info")) {
                    Text("Total Game: \(userGames.games.count)")
                    
                }
                ForEach(userGames.games) { game in
                    Button(action: {
                        selectedGame = game
                    }) {
                        GameCardView(game: game)
                    }
                    .background(
                        NavigationLink("", destination: GameDetailView(game: .constant(game), userGames: userGames, gameComments: gameComments), isActive: Binding(
                            get: { selectedGame == game },
                            set: { newValue in
                                if !newValue {
                                    selectedGame = nil
                                }
                            }
                        ))
                        .opacity(0) // Görünmez yapıyoruz
                    )
                }
            }
            .navigationTitle("My Games")
        }
        .onAppear {
            selectedTabIndex = tabIndex
            userGames.sortElements()
        }
        .onChange(of: selectedTabIndex) { newValue in
            if newValue != tabIndex {
                selectedGame = nil
            }
        }
    }
}


struct UserGamesView_PreviewProvider: PreviewProvider
{
    static var userGames = UserGamesViewModel(games: BaseGame.sampleData, events: GameEvents())
    
    static var previews: some View {
        UserGamesView(userGames: userGames, gameComments: GameCommentViewModel(),selectedTabIndex: .constant(1))
    }
}



