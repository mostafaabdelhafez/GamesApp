//
//  Home+Search.swift
//  DCAFood
//
//  Created by jobzella on 06/03/2023.
//

import UIKit
extension HomeViewController: UISearchBarDelegate,UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text,text.count >= 3{
            
            filterGamesForSearchText(searchController.searchBar.text!)
        }
      }

}
