//
//  API.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 02/02/21.
//

import Foundation
import Alamofire

protocol PokeAPI {
    func getPokemon(by id: Int, _ completionHandler: @escaping (Data?) -> Void)
    func getPokemon(by name: String, _ completionHandler: @escaping (Data?) -> Void)
    func getPokemonList(limit: Int, offset: Int, _ completionHandler: @escaping (Data?) -> Void)
    func getEvolutionChain(by id: Int, _ completionHandler: @escaping (Data?) -> Void)
    func getAbility(by id: Int, _ completionHandler: @escaping (Data?) -> Void)
    func getAbility(by name: String, _ completionHandler: @escaping (Data?) -> Void)
}

class API: PokeAPI {
    func getPokemon(by id: Int, _ completionHandler: @escaping (Data?) -> Void) {
        let urlRequest = Endpoint.pokemon(id: id).url
        
        AF.request(urlRequest)
            .validate(statusCode: 200...299)
            .response { response in completionHandler(response.data) }
    }
    
    func getPokemon(by name: String, _ completionHandler: @escaping (Data?) -> Void) {
        let urlRequest = Endpoint.pokemon(name: name).url
        
        AF.request(urlRequest)
            .validate(statusCode: 200...299)
            .response { response in completionHandler(response.data) }
    }
    
    func getPokemonList(limit: Int, offset: Int, _ completionHandler: @escaping (Data?) -> Void) {
        let urlRequest = Endpoint.pokemonList(offset: offset, limit: limit).url
        
        AF.request(urlRequest)
            .validate(statusCode: 200...299)
            .response { response in completionHandler(response.data) }
    }
    
    func getEvolutionChain(by id: Int, _ completionHandler: @escaping (Data?) -> Void) {
        let urlRequest = Endpoint.evolutionChain(id: id).url
        
        AF.request(urlRequest)
            .validate(statusCode: 200...299)
            .response { response in completionHandler(response.data) }
    }
    
    func getAbility(by id: Int, _ completionHandler: @escaping (Data?) -> Void) {
        let urlRequest = Endpoint.ability(id: id).url
        
        AF.request(urlRequest)
            .validate(statusCode: 200...299)
            .response { response in completionHandler(response.data) }
    }
    
    func getAbility(by name: String, _ completionHandler: @escaping (Data?) -> Void) {
        let urlRequest = Endpoint.ability(name: name).url
        
        AF.request(urlRequest)
            .validate(statusCode: 200...299)
            .response { response in completionHandler(response.data) }
    }
}
