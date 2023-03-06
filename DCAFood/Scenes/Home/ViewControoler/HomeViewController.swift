//
//  HomeViewController.swift
//  DCAFood
//
//  Created by jobzella on 03/03/2023.
//

import UIKit
import Foundation
class HomeViewController: UIViewController {
    var isSearchEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltered: Bool {
        
      return searchController.isActive && !isSearchEmpty
    }

    var searchText:String = ""
    let searchController = UISearchController(searchResultsController: nil)

    var games = [GameModel](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var filteredGames = [GameModel](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    @IBOutlet weak var tableView:UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            let cellNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
            tableView.register(cellNib.self, forCellReuseIdentifier: "HomeTableViewCell")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationController?.navigationBar.prefersLargeTitles = true
        tabBarController?.navigationController?.isNavigationBarHidden = false
        tabBarController?.navigationItem.title = "Games"

    }
    func setup(search:UISearchController,on navItem :UINavigationItem?){
        search.searchBar.delegate = self
        search.searchBar.placeholder = "Search For the Games"
        search.searchResultsUpdater = self

        definesPresentationContext = true
        
        navItem?.searchController = search
    }
    func filterGamesForSearchText(_ searchText: String) {
        Request.request(method: .GET, endpoint:.gameSearch(page: 1, key: searchText), completion: { data in
            guard data != nil else{return}
            if let games = try? JSONDecoder().decode(BaseModel.self, from: data!).results {
                print(games.count)
                self.filteredGames = games
                }
        })

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup(search: searchController, on: tabBarController?.navigationItem)

        Request.request(method: .GET, endpoint:.games(page: 1), completion: { data in
            guard data != nil else{return}
            if let games = try? JSONDecoder().decode(BaseModel.self, from: data!).results {
                print(games.count)
                
                self.games = games
                }

        })
        // Do any additional setup after loading the view.
    }

}
extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isFiltered ? filteredGames.count : games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell
        else{
            return UITableViewCell()
        }
        
        let game = isFiltered ? filteredGames[indexPath.row] : games[indexPath.row]
        cell.configureWith(model: game)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        136
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVc = DetailsViewcontroller(id: games[indexPath.row].id ?? 0)
        navigationController?.pushViewController(detailsVc, animated: true)
    }
    
    
}
