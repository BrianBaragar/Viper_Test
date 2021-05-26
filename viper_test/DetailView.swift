//
//  DetailView.swift
//  viper_test
//
//  Created by Brian Baragar on 20/05/21.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imagePokemon: UIImageView!
    
    // MARK: Properties
    var presenter: DetailPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension DetailView: DetailViewProtocol {
    
    func imageOfPokemon(imageData: Data) {
        let image = UIImage(data: imageData)
        DispatchQueue.main.async {
            self.imagePokemon.image = image
        }
    }
    
    // TODO: implement view output methods

    func showPokemonInView(data: DetailPokemon) {
        DispatchQueue.main.async {
            self.textLabel.text = data.name
        }
    }
}
