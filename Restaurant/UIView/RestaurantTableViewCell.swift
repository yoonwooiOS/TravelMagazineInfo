//
//  RestaurantTableViewCell.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/28/24.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    
    @IBOutlet var menuImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var adressLabel: UILabel!
    @IBOutlet var priceLabel: UILabel! //price
    @IBOutlet var numberLabel: UILabel! //number
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUiLayout()
    }
    
    func configureUiLayout() {
        nameLabel.titlePrimaryLabel(textColor: .black, fontSize: 16)
        adressLabel.subtitlePrimaryLabel(textColor: .lightGray)
        priceLabel.subtitlePrimaryLabel(textColor: .black)
        numberLabel.subtitlePrimaryLabel(textColor: .black)
        
        
    }
    
    func configureFoodCell(data:Restaurant) {
        nameLabel.text = data.name
        adressLabel.text = data.address
        priceLabel.text = data.price.formatted() + "원"
        numberLabel.text = data.phoneNumber
    }
    
}
