//
//  DetailWireFrame.swift
//  viper_test
//
//  Created by Brian Baragar on 20/05/21.
//  
//

import Foundation
import UIKit

class DetailWireFrame: DetailWireFrameProtocol {

    class func createDetailModule(with data: String) -> UIViewController {
        let viewControler = mainStoryboard.instantiateViewController(withIdentifier: "DetailView")
        if let view = viewControler as? DetailView{
            let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
            let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol = DetailInteractor()
            let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
            let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
            let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            presenter.datoUrlString = data
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewControler
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "DetailView", bundle: Bundle.main)
    }
    
}
