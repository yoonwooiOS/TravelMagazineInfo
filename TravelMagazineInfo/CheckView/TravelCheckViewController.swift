//
//  TravelCheckViewController.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/29/24.
//

import UIKit
import Kingfisher

class TravelCheckViewController: UIViewController {
    
    
    var titlelabel:String?
    
    @IBOutlet var checkImageView: UIImageView!
    @IBOutlet var checkDescriptionLabel: UILabel!
   
    @IBOutlet var checkSaveStar: UILabel!
    
    @IBOutlet var goReservationButton: UIButton!
    
    
    var data: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        configureLayout()
       
        
    }
    
    func configureLayout() {
        
        guard let data = data else { return }
        guard let urlstring = data.travel_image, let url = URL(string: urlstring) else { return }
        
        navigationItem.title = data.title
        
        checkImageView.kf.setImage(with: url)
        
        checkDescriptionLabel.text = data.description
        
        checkSaveStar.text = data.saveGrade
        
        checkImageView.contentMode = .scaleAspectFill
        checkImageView.layer.cornerRadius = 10
        
        checkDescriptionLabel.titlePrimaryLabel(textAlignment: .left, fontSize: 24, textColor: .black)
        
        goReservationButton.setTitle("최저가로 예약하러 가기", for: .normal)
        goReservationButton.tintColor = .white
        goReservationButton.backgroundColor = .systemPink
        goReservationButton.layer.cornerRadius = 12
    }
    
    

}
