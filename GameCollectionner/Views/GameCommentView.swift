//
//  GameCommentView.swift
//  SolidifyApp
//
//  Created by Necati Akpınar on 27.10.2023.
//

import SwiftUI

struct GameCommentView: View {
    @State var comment: String
    var gameID: UUID
    var gameComments: GameCommentViewModel

    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color.black.opacity(0.5)) 
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 75)
                .opacity(0.3)
                .clipShape(RoundedRectangle(cornerRadius: 15)) 
                .overlay(
                    HStack {
                        Text(comment)
                        Spacer()
                        Button(action: {
                            gameComments.removeComment(gameID: gameID, comment: comment)
                        })
                        {
                            Image(systemName: "minus.circle")
                        }
                    }.padding(10)
                )
        }
        .padding(2)
    }
}


struct GameCommentView_PreviewProvider: PreviewProvider {
    
    static var previews: some View {
        GameCommentView(comment: "It's a test comment", gameID: UUID(), gameComments: GameCommentViewModel())
        
    }
}
