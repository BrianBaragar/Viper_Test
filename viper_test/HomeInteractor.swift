//
//  HomeInteractor.swift
//  viper_test
//
//  Created by Brian Baragar on 19/05/21.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    var pokemons =  [Pokemons]()

    func getData() {
        ///Decirle a la api de conexión externa que tiene que traer unos datos
        remoteDatamanager?.apiGetData()
    }
    
    func getNextPokemon() {
        remoteDatamanager?.apiNextPokemon()
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    func remoteDataManagerCallbackData(with pokemons: [Pokemons]) {
        //El interactor debe enviarle los datos al presenter
        //Los datos tienen que estar digeridos para el presenter
        pokemons.forEach { pokemon in
            self.pokemons.append(pokemon)
        }
        presenter?.interactorPushDataPresenter(receivedData: self.pokemons)
    }
    
    func remoteDataManagerCallbackNextpokemon(with pokemons: [Pokemons]) {
        presenter?.interactoPushPokemonsPresenter(pokemons: pokemons)
    }
    
    // TODO: Implement use case methods
}
