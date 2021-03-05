//
//  Endpoint.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 02/02/21.
//

import Foundation

struct Endpoint {
    private let path: String
    private let queryItems: [URLQueryItem]?
    private let version = "v2"
    private static let defaultLimit = 20
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "pokeapi.co"
        components.path = "/api/\(version)/\(path)"
        components.queryItems = queryItems
        
        return components.url!
    }
    
    static func pokemon(id: Int, offset: Int = 0, limit: Int = defaultLimit) -> Endpoint {
        return Endpoint(
            path: "pokemon/\(id)",
            queryItems: [
                URLQueryItem(name: "offset", value: String(offset)),
                URLQueryItem(name: "limit", value: String(limit))
            ]
        )
    }
    
    static func pokemon(name: String, offset: Int = 0, limit: Int = defaultLimit) -> Endpoint {
        return Endpoint(
            path: "pokemon/\(name)",
            queryItems: [
                URLQueryItem(name: "offset", value: String(offset)),
                URLQueryItem(name: "limit", value: String(limit))
            ]
        )
    }
    
    static func pokemonList(offset: Int = 0, limit: Int = defaultLimit) -> Endpoint {
        return Endpoint(
            path: "pokemon",
            queryItems: [
                URLQueryItem(name: "offset", value: String(offset)),
                URLQueryItem(name: "limit", value: String(limit))
            ]
        )
    }
    
    static func evolutionChain(id: Int) -> Endpoint {
        return Endpoint(
            path: "evolution-chain/\(id)",
            queryItems: []
        )
    }
    
    static func ability(id: Int) -> Endpoint {
        return Endpoint(
            path: "ability/\(id)",
            queryItems: []
        )
    }
    
    static func ability(name: String) -> Endpoint {
        return Endpoint(
            path: "ability/\(name)",
            queryItems: []
        )
    }
    
}
