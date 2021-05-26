//
//  HomeView.swift
//  viper_test
//
//  Created by Brian Baragar on 19/05/21.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    // MARK: Properties
    var presenter: HomePresenterProtocol?
    var pokemons =  [Pokemons]()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    @IBAction func pushOnNext(_ sender: UIBarButtonItem) {
        presenter?.getNextPokemons()
    }
    
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
    func presenterPushDataToView(receiverData: [Pokemons]) {
        self.pokemons = receiverData
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func cargarActivity() {
        DispatchQueue.main.async {
            self.activity.startAnimating()
        }
    }
    
    func stopAndHideActivity() {
        DispatchQueue.main.async {
            self.activity.stopAnimating()
            self.activity.hidesWhenStopped = true
        }
    }
}
extension HomeView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell( style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = pokemons[indexPath.row].name
        return cell
    }
}

extension HomeView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailView(with: pokemons[indexPath.row].name)
    }
    
}

