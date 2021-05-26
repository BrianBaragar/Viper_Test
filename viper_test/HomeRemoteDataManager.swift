//
//  HomeRemoteDataManager.swift
//  viper_test
//
//  Created by Brian Baragar on 19/05/21.
//  
//

import Foundation

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    
    var responsePokeApi =  ResponsePokemon()
    
    func apiGetData() {
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20&offset=200")!)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/x-www-form-urlencoded; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        session.dataTask(with: request) {(data, response, error) in
            guard let data = data, error == nil, let respuesta = response as? HTTPURLResponse else{
                print("Error de conexión\(error!)")
                return
            }
            if respuesta.statusCode == 200{
                do {
                    let decoder = JSONDecoder()
                    self.responsePokeApi = try decoder.decode(ResponsePokemon.self, from: data)
                    //Enviar de vuelta los datos al interactor
                    self.remoteRequestHandler?.remoteDataManagerCallbackData(with: self.responsePokeApi.results)
                } catch  {
                    print("No se ha podido parsear el archivo error: \(error.localizedDescription)")
                }
                
            }else{
                print("Ha habido un error \(respuesta.statusCode)")
            }
        }.resume()
    }
    
    func apiNextPokemon() {
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "https://pokeapi.co/api/v2/pokemon?limit=30&offset=200")!)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/x-www-form-urlencoded; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        session.dataTask(with: request) {(data, response, error) in
            guard let data = data, error == nil, let respuesta = response as? HTTPURLResponse else{
                print("Error de conexión\(error!)")
                return
            }
            if respuesta.statusCode == 200{
                do {
                    let decoder = JSONDecoder()
                    self.responsePokeApi = try decoder.decode(ResponsePokemon.self, from: data)
                    //Enviar de vuelta los datos al interactor
                    self.remoteRequestHandler?.remoteDataManagerCallbackNextpokemon(with: self.responsePokeApi.results)
                } catch  {
                    print("No se ha podido parsear el archivo error: \(error.localizedDescription)")
                }
                
            }else{
                print("Ha habido un error \(respuesta.statusCode)")
            }
        }.resume()
    }
    
}
