//
//  CharacterRow.swift
//  SampleNetworkingWithCombine
//
//  Created by 부재식 on 1/11/25.
//

import SwiftUI

struct CharacterRow: View {
    
    var character: Character
    
    var body: some View {
        HStack {
            AsyncImage(url: character.image) { image in
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous))
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
            Text(character.name)
        }
    }
}

//#Preview {
//    CharacterRow()
//}
