//
//  Popularity CitiyDetailInfoViewController.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/27/24.
//

import UIKit
import Kingfisher

class PopularityCityDetailInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var navigationTitleLabel: UINavigationItem!
    
    @IBOutlet var cityDetailInfoTableView: UITableView!
    
    var citiyInfoList:[Travel] = TravelInfo().travel {
        
        didSet {
            
            cityDetailInfoTableView.reloadData()
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTalbeView()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return citiyInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = citiyInfoList[indexPath.row]
        if data.ad {
            
            let adcell = tableView.dequeueReusableCell(withIdentifier: "adcell", for: indexPath) as! AdTableViewCell
            
            adcell.configureAdCell(data: data, bgColor: UIColor.random())
            
            return adcell
            
        } else {
            
            let infocell = tableView.dequeueReusableCell(withIdentifier: "CitiyDetailInfo", for: indexPath) as! PopularityCitiyDetailInfoViewControllerTableViewCell
            
            infocell.configureInfoCell(data: data)
            
            infocell.bookmarkButton.tag = indexPath.row
            infocell.bookmarkButton.addTarget(self, action: #selector(bookmarkButton), for: .touchUpInside)
            
            return infocell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = citiyInfoList[indexPath.row]
        
        if data.ad {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "AdCheckViewController") as! AdCheckViewController
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            vc.data = data
            present(nav, animated: true)
            
        } else {

            let vc = storyboard?.instantiateViewController(withIdentifier: "TravelCheckViewController") as! TravelCheckViewController
            vc.data = data
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    func configureTalbeView() {
        
        navigationTitleLabel.title = "도시 상세 정보"
        
        navigationItem.backBarButtonItem?.tintColor = .black
        let blackBackButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        blackBackButton.tintColor = .black
        navigationItem.backBarButtonItem = blackBackButton
    
        
        cityDetailInfoTableView.rowHeight = 130
        cityDetailInfoTableView.delegate = self
        cityDetailInfoTableView.dataSource = self
        
        let xibDetailInfo = UINib(nibName:"PopularityCitiyDetailInfoViewControllerTableViewCell",  bundle: nil)
        cityDetailInfoTableView.register(xibDetailInfo, forCellReuseIdentifier: "CitiyDetailInfo")
        
        let xibAd = UINib(nibName: "AdTableViewCell", bundle: nil)
        cityDetailInfoTableView.register(xibAd, forCellReuseIdentifier: "adcell")
        
        
        
    }
    
    @objc func bookmarkButton(_ sender:UIButton) {
        
        let index = sender.tag
        
        citiyInfoList[index].like?.toggle()
        
    }
    
}

