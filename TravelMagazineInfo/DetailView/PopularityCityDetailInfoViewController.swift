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
    
    var citiyInfoList:[Travel] = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationTitleLabel.title = "도시 상세 정보"
        
        cityDetailInfoTableView.rowHeight = 130
        cityDetailInfoTableView.delegate = self
        cityDetailInfoTableView.dataSource = self
        
        let xibDetailInfo = UINib(nibName:"PopularityCitiyDetailInfoViewControllerTableViewCell",  bundle: nil)
        cityDetailInfoTableView.register(xibDetailInfo, forCellReuseIdentifier: "CitiyDetailInfo")
        
        let xibAd = UINib(nibName: "AdTableViewCell", bundle: nil)
        cityDetailInfoTableView.register(xibAd, forCellReuseIdentifier: "adcell")
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiyInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = citiyInfoList[indexPath.row]
        if data.ad {
            let adcell = tableView.dequeueReusableCell(withIdentifier: "adcell", for: indexPath) as! AdTableViewCell
            
            adcell.configureAddCellLayout(data: data)
            
            return adcell
            
        } else {
            
            let infocell = tableView.dequeueReusableCell(withIdentifier: "CitiyDetailInfo", for: indexPath) as! PopularityCitiyDetailInfoViewControllerTableViewCell
            
            infocell.configureInfoCellLayout(data: data)

            return infocell
            
        }
    }
}

