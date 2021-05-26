//
//  DetailPokemon.swift
//  viper_test
//
//  Created by Brian Baragar on 20/05/21.
//

import Foundation

struct DetailPokemon: Codable {
    var name: String
    var sprites: sprites
}

struct sprites: Codable {
    var other: other
}

struct other: Codable {
    var artwork: artwork
    enum CodingKeys: String, CodingKey {
        case artwork =  "official-artwork"
    }
}
struct artwork: Codable {
    var front_default: String
}
