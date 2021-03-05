//
//  API.swift
//  CoutinhoDex
//
//  Created by Gabriel Coutinho on 02/02/21.
//

import Foundation
import Alamofire
import AlamofireImage

protocol PokeAPI {
    func getPokemon(by id: Int, _ completionHandler: @escaping (Data?) -> Void)
    func getPokemon(by name: String, _ completionHandler: @escaping (Data?) -> Void)
    func getPokemonImage(by url: String, _ completionHandler: @escaping (NSObject?) -> Void)
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
    
    func getPokemonImage(by url: String, _ completionHandler: @escaping (NSObject?) -> Void) {
        AF.request(url)
            .validate(statusCode: 200...299)
            .responseImage { response in
                completionHandler(response.value as NSObject?)
            }
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
