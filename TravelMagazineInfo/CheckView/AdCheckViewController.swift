//
//  AdCheckViewController.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/29/24.
//

import UIKit

class AdCheckViewController: UIViewController {

    var receiveTitleData:String?
    
    @IBOutlet var receiveTitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        
        receiveTitleLabel.text = receiveTitleData
        receiveTitleLabel.titlePrimaryLabel(textAlignment: .center, fontSize: 24, textColor: .black)
        
    }
    
    @objc func popButton(){
        
        dismiss(animated: true)
        
    }
    func configureNavigationBar() {
        
        navigationItem.title = "광고 확인"
        let backButton =  UIBarButtonItem(title: "X", style: .plain, target: self, action: #selector(popButton))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        
    }
}
