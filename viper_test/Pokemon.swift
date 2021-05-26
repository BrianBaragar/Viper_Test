//
//  Pokemon.swift
//  viper_test
//
//  Created by Brian Baragar on 20/05/21.
//

import Foundation

struct ResponsePokemon: Codable {
    var results = [Pokemons]()
}

struct Pokemons: Codable {
    var name: String
}
