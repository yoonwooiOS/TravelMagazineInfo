//
//  AdCheckViewController.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/29/24.
//

import UIKit

class AdCheckViewController: UIViewController {

    
    var data:Travel?
    
    @IBOutlet var receiveTitleLabel: UILabel!
    
    @IBOutlet var backgroundColor: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureLayOut()
        
    }
    func configureLayOut() {
        backgroundColor.backgroundColor = data?.bgView
        receiveTitleLabel.text = data?.title
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
