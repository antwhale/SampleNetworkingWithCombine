//
//  ContentView.swift
//  SampleNetworkingWithCombine
//
//  Created by 부재식 on 1/11/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject
    var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.characters) { character in
                CharacterRow(character: character)
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchCharacters()
        }
    }
}

#Preview {
    ContentView()
}
