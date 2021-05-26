//
//  HomePresenter.swift
//  viper_test
//
//  Created by Brian Baragar on 19/05/21.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        //Decirle al interactor que quiere traer unos datos
        interactor?.getData()
        view?.cargarActivity()
    }
    
    func getNextPokemons() {
        interactor?.getNextPokemon()
        view?.cargarActivity()
    }
    
    func showDetailView(with data: String) {
        //Presentar la nueva vista
        wireFrame?.presentDetailView(from: view!, whidtData: data)
    }
    
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods

    func interactorPushDataPresenter(receivedData: [Pokemons]) {
        //Le decimos a la vista que pinte los datos
        view?.presenterPushDataToView(receiverData: receivedData)
        view?.stopAndHideActivity()
    }
    
    func interactoPushPokemonsPresenter(pokemons: [Pokemons]) {
        view?.presenterPushDataToView(receiverData: pokemons)
        view?.stopAndHideActivity()
    }

    
}
