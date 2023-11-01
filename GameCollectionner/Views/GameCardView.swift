import SwiftUI

struct GameCardView:  View {
    var game: BaseGame
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Game Name:").font(.headline)
                Text("\(game.name)")
            }
            HStack {
                Text("Genre:").font(.headline)
                Text("\(game.genre.description)")
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 15)
        .padding(.horizontal, 20)
        .background(Theme.ColorScheme.primary.color)
        .foregroundColor(.black)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2)
        )
    }
    
}

struct GameCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        GameCardView(game: BaseGame.sampleData[0])
    }
}
