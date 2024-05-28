//
//  TravelMagazineInfolTableViewController.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/26/24.
//

import UIKit
import Kingfisher

class TravelMagazineInfolTableViewController: UITableViewController {
    
    let travelImazineInfo:[Magazine] = MagazineInfo().magazine
    
    @IBOutlet var titleLabel: UINavigationItem!
    override func viewDidLoad() {
        
        configureTableView()
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelImazineInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelMagazineInfo") as! TravelMagazineInfolTableViewCell
        let data = travelImazineInfo[indexPath.row]
        
        cell.titleLabel.titlePrimaryLabel(textAlignment: .left, fontSize: 20, textColor: .black)
        cell.subtitleLabel.subtitlePrimaryLabel(textAlignment: .right, fontSize: 14, textColor: .systemGray3)
        cell.dateLabel.subtitlePrimaryLabel(textAlignment: .left, fontSize: 14, textColor: .systemGray3)
        
        return cell
    }
    
    func configureTableView() {
        
        tableView.rowHeight = 435
        titleLabel.title = "SeSAC TRAVEL"
    }
}
