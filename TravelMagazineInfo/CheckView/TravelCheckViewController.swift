//
//  TravelCheckViewController.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/29/24.
//

import UIKit

class TravelCheckViewController: UIViewController {
    
    
    var titlelabel:String?
    
    @IBOutlet var travelTitleLabel: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "관광지 확인"
        travelTitleLabel.text = titlelabel
        travelTitleLabel.titlePrimaryLabel(textAlignment: .center, fontSize: 24, textColor: .brown)
    }

}
