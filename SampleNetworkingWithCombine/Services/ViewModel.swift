//
//  NetworkingService.swift
//  SampleNetworkingWithCombine
//
//  Created by 부재식 on 1/11/25.
//

import Foundation
import Combine

class ViewModel : ObservableObject {
    @Published var characters: [Character] = []
    var subscriptions = Set<AnyCancellable>()
    
    func fetchCharacters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map {
                $0.data
            }.decode(type: CharacterResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("Data Fetched")
                }
                
                
            }, receiveValue: { decodedData in
                print("receiveValue, count: \(decodedData.results.count)")
                self.characters = decodedData.results
            })
            .store(in: &subscriptions)
        
    }
}


//class NetworkingService {
//    var characters: [Character] = []
//    var subscriptions = Set<AnyCancellable>()
//    
//    func fetchCharacters() {
//        guard let url = URL(string: "")
//    }
//}
