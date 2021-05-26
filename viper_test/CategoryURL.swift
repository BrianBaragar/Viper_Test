//
//  CategoryURL.swift
//  viper_test
//
//  Created by Brian Baragar on 19/05/21.
//

import Foundation

struct CategoryURL: Codable {
     
    var _links: Links
    
    struct Links: Codable {
        var urlDato: [datoUrl]
        enum CodingKeys: String, CodingKey{
            case urlDato =  "self"
        }
    }
    
    struct datoUrl:Codable {
        var href: String
    }
    
}
