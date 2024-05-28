//
//  TravelMagazineInfolTableViewController.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/26/24.
//

import UIKit
import Kingfisher

class TravelMagazineInfolTableViewController: UITableViewController {
    
    let travelImazineInfo = MagazineInfo().magazine
    
    @IBOutlet var titleLabel: UINavigationItem!
    override func viewDidLoad() {
        
        let xib = UINib(nibName: "TravelMagazineInfo", bundle: nil)
        tableView.register(xib, forHeaderFooterViewReuseIdentifier: "TravelMagazineInfo")
        
        tableView.rowHeight = 435
        titleLabel.title = "SeSAC TRAVEL"
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelImazineInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelMagazineInfo") as! TravelMagazineInfolTableViewCell
        let data = travelImazineInfo[indexPath.row]
        
        let url = URL(string: data.photo_image)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyMMdd"
        
        guard let date = dateformatter.date(from: data.date) else {
            print(data.date)
            cell.dateLabel.text = data.date
            return cell }
        dateformatter.dateFormat = "yy년MM월dd일"
        let formatteddate = dateformatter.string(from: date)
        
        cell.titleLabel.text = data.title
        
        cell.subtitleLabel.text = data.subtitle
        cell.dateLabel.text = formatteddate
        cell.titleLabel.font = .systemFont(ofSize: 20)
        cell.titleLabel.lineBreakMode = .byWordWrapping
        cell.titleLabel.numberOfLines = 0
        
        cell.subtitleLabel.font = .systemFont(ofSize: 14)
        cell.subtitleLabel.textColor = .systemGray3
        
        cell.dateLabel.textAlignment = .right
        cell.dateLabel.font = .systemFont(ofSize: 14)
        cell.dateLabel.textColor = .systemGray3
        
        cell.travelImage.kf.setImage(with:url)
        cell.travelImage.contentMode = .scaleToFill
        cell.travelImage.layer.cornerRadius = 7
        
        return cell
    }
    
    func fomattedDate() {
        
        
        
        
        
    }
    
   

}
