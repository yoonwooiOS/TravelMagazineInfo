//
//  RestInfoTableViewCell.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/28/24.
//

import UIKit
import Kingfisher

class RestInfoTableViewCell: UITableViewCell {

    @IBOutlet var resImageView: UIImageView!
    
    @IBOutlet var resNameLabel: UILabel!
    
    @IBOutlet var resAddressLabel: UILabel!
    
    @IBOutlet var resPhoneNumberLabel: UILabel!
    
    
    @IBOutlet var restPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureLabel()
        
    }
    
    func configureLabel() {
       
        resImageView.contentMode = .scaleToFill
        
        resNameLabel.titlePrimaryLabel(textAlignment: .left, fontSize: 20, textColor: .black)
        
        resAddressLabel.subtitlePrimaryLabel(textAlignment: .left, fontSize: 14, textColor: .systemGray)
        
        restPriceLabel.subtitlePrimaryLabel(textAlignment: .left, fontSize: 14, textColor: .black)
        
        resPhoneNumberLabel.subtitlePrimaryLabel(textAlignment: .left, fontSize: 14, textColor: .black)
        
    }
    
    func configureCell(data: Restaurant) {
        
        
        resImageView.primaryImageView(urlString: data.image, contendMode: .scaleToFill, cornerRadius: 10)
       
        resNameLabel.text = data.name
        
        resAddressLabel.text = data.address
        
        resPhoneNumberLabel.text = data.phoneNumber
        
        restPriceLabel.text = data.price.formatted() + "원"
        
    }
    
   
    
}
