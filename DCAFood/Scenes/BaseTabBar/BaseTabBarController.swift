//
//  BaseTabBarController.swift
//  DCAFood
//
//  Created by jobzella on 05/03/2023.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeVC = HomeViewController()
        let favVC = FavouritesViewController()

        let homeTab = UITabBarItem(title: "Games", image: UIImage(named: "Vector"), tag: 0)
        let favouritesTab = UITabBarItem(title: "Favourites", image: UIImage(named: "Icon"), tag: 0)
        
        homeVC.tabBarItem = homeTab
        favVC.tabBarItem = favouritesTab


        self.viewControllers = [homeVC,favVC]

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
