import SwiftUI

struct UserGamesView: View {
    @StateObject var userGames: UserGames
    @State private var selectedGame: BaseGame?
    @Binding var selectedTabIndex: Int
    let tabIndex = 2
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userGames.games) { game in
                    Button(action: {
                        selectedGame = game
                    }) {
                        GameCardView(game: game)
                    }
                    .background(
                        NavigationLink("", destination: GameDetailView(game: .constant(game), userGames: userGames), isActive: Binding(
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
            .navigationTitle("Games")
        }
        .onAppear {
            selectedTabIndex = tabIndex
        }
        .onChange(of: selectedTabIndex) { newValue in
            if newValue != tabIndex {
                print("tab degisti")
                selectedGame = nil
            }
        }
    }
}


struct UserGamesView_PreviewProvider: PreviewProvider
{
    static var userGames = UserGames(games: BaseGame.sampleData, events: GameEvents())
    
    static var previews: some View {
        UserGamesView(userGames: userGames, selectedTabIndex: .constant(1))
    }
}



