//
//  FavouritesViewController.swift
//  DCAFood
//
//  Created by jobzella on 05/03/2023.
//

import UIKit

class FavouritesViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationController?.navigationBar.prefersLargeTitles = true
        tabBarController?.navigationController?.isNavigationBarHidden = false
        tabBarController?.navigationItem.title = "Favourites"
        tabBarController?.navigationController?.navigationItem.searchController = nil
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
