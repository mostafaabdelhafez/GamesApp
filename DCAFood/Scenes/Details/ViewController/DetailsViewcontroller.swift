//
//  DetailsViewcontroller.swift
//  DCAFood
//
//  Created by jobzella on 03/03/2023.
//

import UIKit

class DetailsViewcontroller: UIViewController {
    var headerView:DetailsHeaderView = UIView.fromNib()
    @IBOutlet weak var tableView:UITableView!{
        didSet{
            headerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height * 0.4)
            tableView.tableHeaderView = headerView
            tableView.delegate = self
            tableView.dataSource = self
            let nib = UINib(nibName: "DetailsTableViewCell", bundle: nil)
            tableView.register(nib.self, forCellReuseIdentifier: "DetailsTableViewCell")
        }
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
extension DetailsViewcontroller:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as? DetailsTableViewCell
        else{return UITableViewCell()}
        
        cell.name.text = "Header"
        cell.desc.text = "Cell"
                
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
}
