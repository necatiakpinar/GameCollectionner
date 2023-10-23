import SwiftUI

struct GameDetailView: View {
    @Binding var game: BaseGame
    @State private var isAdded: Bool = false
    
    var body: some View {
        List {
            Section(header: Text("Definition")) {
                Text("Last of us is a great game bro")
                
                Button(action: {
                    isAdded.toggle()
                }) {
                    HStack {
                        if isAdded {
                            Image(systemName: "checkmark")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.green)
                        } else {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                        }
                        
                        Text(isAdded ? "Added" : "Add to your collection")
                            .foregroundColor(isAdded ? .green : .blue)
                    }
                }
            }
        }
        .buttonStyle(PlainButtonStyle()) // Bu satırı ekleyin
        .navigationTitle(game.name)
    

    }
}


struct GamedetailView_PreviewProvider: PreviewProvider
{
    static var previews: some View {
        GameDetailView(game: .constant(BaseGame.sampleData[0]))
    }
}
