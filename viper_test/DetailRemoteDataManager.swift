//
//  DetailRemoteDataManager.swift
//  viper_test
//
//  Created by Brian Baragar on 20/05/21.
//  
//

import Foundation

class DetailRemoteDataManager:DetailRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: DetailRemoteDataManagerOutputProtocol?
        
    func apiGetPokemon(name: String) {
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "https://pokeapi.co/api/v2/pokemon/\(name)")!)
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
                    let pokemonDetail = try decoder.decode(DetailPokemon.self, from: data)
                    //Enviar de vuelta los datos al interactor
                    self.remoteRequestHandler?.remoteDataManagerCallbackData(with: pokemonDetail)
                } catch  {
                    print("No se ha podido parsear el archivo error: \(error.localizedDescription)")
                }
                
            }else{
                print("Ha habido un error \(respuesta.statusCode)")
            }
        }.resume()
    }
    
    func remoteImageUrl(url: String) {
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            if error != nil{return}
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200{
                guard let data = data else {return}
                self.remoteRequestHandler?.remoteImageUrlCallBack(with: data)
            }
        }.resume()
    }
}
