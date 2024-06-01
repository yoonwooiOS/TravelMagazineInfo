//
//  TravelMagazineInfoViewController.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 6/1/24.
//

import UIKit
import Kingfisher


class TravelMagazineInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    let magazineInfoList:[Magazine] = MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return magazineInfoList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelMagazineInfoTableViewCell") as! TravelMagazineInfoTableViewCell
        let data = magazineInfoList[indexPath.row]
        
        cell.configureCell(data: data)
       
        return cell
        
    }
    
    func configureTableView() {
        
        tableView.rowHeight = 450
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let xib = UINib(nibName: "TravelMagazineInfoTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "TravelMagazineInfoTableViewCell")
        
        navigationItem.title = "SeSSAC TRAVEL"
        
    }
    
}
