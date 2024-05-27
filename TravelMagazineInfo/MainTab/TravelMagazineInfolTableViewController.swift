//
//  TravelMagazineInfolTableViewController.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/26/24.
//

import UIKit
import Kingfisher

class TravelMagazineInfolTableViewController: UITableViewController {
    
    let travelImazineInfo = MagazineInfo()
    
    @IBOutlet var titleLabel: UINavigationItem!
    override func viewDidLoad() {
        print(travelImazineInfo)
        
        titleLabel.title = "SeSAC TRAVEL"
        tableView.rowHeight = 435
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelImazineInfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelMagazineInfo") as! TravelMagazineInfolTableViewCell
        let data = travelImazineInfo.magazine[indexPath.row]
        
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
        cell.titleLabel.font = .systemFont(ofSize: 20)
        
        cell.titleLabel.lineBreakMode = .byWordWrapping
        cell.titleLabel.numberOfLines = 0
        
        cell.subtitleLabel.text = data.subtitle
        cell.subtitleLabel.font = .systemFont(ofSize: 14)
        cell.subtitleLabel.textColor = .systemGray3
        
        cell.dateLabel.text = formatteddate
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
