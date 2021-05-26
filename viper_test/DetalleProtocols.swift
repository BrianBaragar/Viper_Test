//
//  DetalleProtocols.swift
//  viper_test
//
//  Created by Brian Baragar on 26/05/21.
//  
//

import Foundation
import UIKit

protocol DetalleViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: DetallePresenterProtocol? { get set }
}

protocol DetalleRouterProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createDetalleModule() -> UIViewController
}

protocol DetallePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: DetalleViewProtocol? { get set }
    var interactor: DetalleInteractorInputProtocol? { get set }
    var router: DetalleRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol DetalleInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol DetalleInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: DetalleInteractorOutputProtocol? { get set }
    var remoteDatamanager: DetalleRemoteDataManagerInputProtocol? { get set }
}

protocol DetalleDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol DetalleRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DetalleRemoteDataManagerOutputProtocol? { get set }
}

protocol DetalleRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

