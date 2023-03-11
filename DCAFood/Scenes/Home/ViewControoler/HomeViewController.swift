//
//  HomeViewController.swift
//  DCAFood
//
//  Created by jobzella on 03/03/2023.
//

import UIKit
import CoreData
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
                self.collectionView.reloadData()
            }
        }
    }
    var filteredGames = [GameModel](){
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var collectionView:UICollectionView!{
        didSet{
            collectionView.delegate = self
            collectionView.dataSource = self
            let cellNib = UINib(nibName: "GamesCollectionViewCell", bundle: nil)
            collectionView.register(cellNib.self, forCellWithReuseIdentifier: "GamesCollectionViewCell")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationController?.navigationBar.prefersLargeTitles = true
        tabBarController?.navigationController?.isNavigationBarHidden = false
        tabBarController?.navigationItem.title = "Games"
        setup(search: searchController, on: tabBarController?.navigationItem)

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
        let group = DispatchGroup()
        group.enter()
        Request.request(method: .GET, endpoint:.games(page: 1), completion: { data in
            defer{group.leave()}
            guard data != nil else{return}
            if let games = try? JSONDecoder().decode(BaseModel.self, from: data!).results {
                print(games.count)
                
                self.games = games
            }
            
        })
        group.notify(queue: .main) {
            self.collectionView.reloadData()
        }

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.reloadData()
    }
    
    


}
extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        isFiltered ? filteredGames.count : games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GamesCollectionViewCell", for: indexPath) as? GamesCollectionViewCell
        else{
            return UICollectionViewCell()
        }
        
        let game = isFiltered ? filteredGames[indexPath.row] : games[indexPath.row]
        cell.configureWith(model: game)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch UIDevice.current.orientation{
        case .portrait:
           return CGSize(width: collectionView.frame.width, height: 136)

        case .landscapeRight,.landscapeLeft:
            
            return  CGSize(width: collectionView.frame.width/2 - 8, height: 136)

        default:
            return   CGSize(width: collectionView.frame.width, height: 136)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsVc = DetailsViewcontroller(id: isFiltered ? filteredGames[indexPath.row].id ?? 0 : games[indexPath.row].id ?? 0,selectedGame: isFiltered ? filteredGames[indexPath.row] : games[indexPath.row])
        
        navigationController?.pushViewController(detailsVc, animated: true)
    }
}
