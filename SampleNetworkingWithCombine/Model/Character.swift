//
//  Character.swift
//  SampleNetworkingWithCombine
//
//  Created by 부재식 on 1/11/25.
//

import Foundation

struct CharacterResponse: Codable {
    let results: [Character]
}

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let image: URL

}
