//
//  Home+Search.swift
//  DCAFood
//
//  Created by jobzella on 06/03/2023.
//

import UIKit
extension HomeViewController: UISearchBarDelegate,UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        reset()
        if let text = searchController.searchBar.text,text.count >= 3{
            filterGamesForSearchText(searchController.searchBar.text!, with: pageNumber)
        }
      }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        reset()
    }
    func reset(){
        pageNumber = 1
        
        self.filteredGames.removeAll()
        self.collectionView.reloadData()
    }

}
