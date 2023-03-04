//
//  HomeViewController.swift
//  DCAFood
//
//  Created by jobzella on 03/03/2023.
//

import UIKit
import Foundation
class HomeViewController: UIViewController {
    var games = [GameModel](){
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

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.isNavigationBarHidden = false
        title = "Games"

        Request.request(method: .GET, endpoint:.games(page: 1), completion: { data in
            guard data != nil else{return}
            if let games = try? JSONDecoder().decode(BaseModel.self, from: data!).results {
                print(games.count)
                
                self.games = games
                }

        })
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
extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell
        else{
            return UITableViewCell()
        }
        let game = games[indexPath.row]
        cell.configureWith(model: game)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        136
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVc = DetailsViewcontroller(nibName: "DetailsViewcontroller", bundle: nil)
        navigationController?.pushViewController(detailsVc, animated: true)
    }
    
    
}
