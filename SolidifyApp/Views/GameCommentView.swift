//
//  GameCommentView.swift
//  SolidifyApp
//
//  Created by Necati Akpınar on 27.10.2023.
//

import SwiftUI

struct GameCommentView: View {
    @State var comment: String
    var body: some View {
        Text(comment)
    }
}


struct GameCommentView_PreviewProvider: PreviewProvider {
    
    static var previews: some View {
        GameCommentView(comment: "Commenttt")
        
    }
}
