//
//  FavouritesViewController.swift
//  DCAFood
//
//  Created by jobzella on 05/03/2023.
//

import UIKit

class FavouritesViewController: UIViewController {
    var emptyLabel:UILabel!
    var games = [GameModel](){
        didSet{
            DispatchQueue.main.async {
                self.showEmptyState = false
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
        tabBarController?.navigationController?.navigationItem.searchController = nil
        self.tabBarController?.navigationItem.title = "Favourites" + "(\(self.games.count))"

    }
    var showEmptyState:Bool{
        set{
            emptyLabel.isHidden = !newValue
            self.collectionView.isHidden = newValue
        }
        get{
            self.showEmptyState
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        emptyLabel = EmptyStateCreator.createWith(text: "There's no Favourites found", on: view)
        showEmptyState = true
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension FavouritesViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        games.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GamesCollectionViewCell", for: indexPath) as? GamesCollectionViewCell
        else{
            return UICollectionViewCell()
        }
        
        let game =  games[indexPath.row]
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
        let detailsVc = DetailsViewcontroller(id: games[indexPath.row].id ?? 0)
        navigationController?.pushViewController(detailsVc, animated: true)
    }

    
}
