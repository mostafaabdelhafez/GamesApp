//
//  DetailsViewcontroller.swift
//  DCAFood
//
//  Created by jobzella on 03/03/2023.
//

import UIKit

class DetailsViewcontroller: UIViewController {
    var headerTitles = ["Game Description","Visit Reddit","Visit Website"]
    var headerView:DetailsHeaderView = UIView.fromNib()
    @IBOutlet weak var tableView:UITableView!{
        didSet{
            headerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height * 0.4)
            tableView.tableHeaderView = headerView
            tableView.delegate = self
            tableView.dataSource = self
            let nib = UINib(nibName: "DetailsTableViewCell", bundle: nil)
            tableView.register(nib.self, forCellReuseIdentifier: "DetailsTableViewCell")
            
            let headerNib = UINib(nibName: "SectionHeader", bundle: nil)
            tableView.register(headerNib.self, forHeaderFooterViewReuseIdentifier: "SectionHeader")

        }
    }
    var id:Int
    var details:DetailsModel!{
        didSet{
            self.tableView.reloadData()
        }
    }
    required init(id:Int) {
        self.id = id
        super.init(nibName: "DetailsViewcontroller", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func favouriteDidTapped(){
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightBarItem = UIBarButtonItem(title: "Favourites", style: .plain, target: self, action: #selector(favouriteDidTapped))
        navigationItem.rightBarButtonItem = rightBarItem
        navigationController?.navigationBar.prefersLargeTitles = false
        Request.request(method: .GET, endpoint: .gameDetails(id: id)) { data in
            guard data != nil else{return}
            
            if let details = try? JSONDecoder().decode(DetailsModel.self, from: data!) {
                
                DispatchQueue.main.async {
                    
                    self.headerView.configure(name: details.name ?? "", image: details.image ?? "")
                    self.details = details
                }
            }
        }

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
        1
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        headerTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as? DetailsTableViewCell
        else{return UITableViewCell()}
        guard details != nil,indexPath.section == 0 else{return UITableViewCell()}
        
            cell.desc.text = details!.description ?? ""
        cell.desc.setLineHeight(lineHeight: 6)
                
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionHeader") as! SectionHeader
        
        guard details != nil else{return UIView()}
        header.headerName.text = headerTitles[section]
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 0 ? UITableView.automaticDimension : 16
        
    }
    
    
}
