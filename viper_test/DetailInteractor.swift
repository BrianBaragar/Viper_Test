//
//  DetailInteractor.swift
//  viper_test
//
//  Created by Brian Baragar on 20/05/21.
//  
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {
    

    // MARK: Properties
    weak var presenter: DetailInteractorOutputProtocol?
    var localDatamanager: DetailLocalDataManagerInputProtocol?
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol?
    
    func detailPokemon(pokemonName: String) {
        remoteDatamanager?.apiGetPokemon(name: pokemonName)
    }
    
    func getImageOfPokemon(url: String) {
        remoteDatamanager?.remoteImageUrl(url: url)
    }
}

extension DetailInteractor: DetailRemoteDataManagerOutputProtocol {
    func remoteImageUrlCallBack(with image: Data) {
        presenter?.pushImageToPresenter(imageData: image)
    }
    
    
    // TODO: Implement use case methods
    func remoteDataManagerCallbackData(with pokemon: DetailPokemon) {
        //El interactor debe enviarle los datos al presenter
        //Los datos tienen que estar digeridos para el presenter
        presenter?.interactorPushDataPresenter(receivedData: pokemon)
    }
}
