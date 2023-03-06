//
//  Home+Search.swift
//  DCAFood
//
//  Created by jobzella on 06/03/2023.
//

import UIKit
extension HomeViewController: UISearchBarDelegate,UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterGamesForSearchText(searchController.searchBar.text!)
      }

}
