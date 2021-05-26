//
//  DetailPresenter.swift
//  viper_test
//
//  Created by Brian Baragar on 20/05/21.
//  
//

import Foundation

class DetailPresenter: DetailPresenterProtocol  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var datoUrlString: String?
    var pokemon: DetailPokemon?
    // TODO: implement presenter methods
    func viewDidLoad() {
        if let datoRecibido = datoUrlString {
            interactor?.detailPokemon(pokemonName: datoRecibido)
        }
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    
    func interactorPushDataPresenter(receivedData: DetailPokemon) {
        interactor?.getImageOfPokemon(url: receivedData.sprites.other.artwork.front_default)
        view?.showPokemonInView(data: receivedData)
    }
    
    func pushImageToPresenter(imageData: Data) {
        view?.imageOfPokemon(imageData: imageData)
    }
    
    // TODO: implement interactor output methods
}
