//
//  PopularCityViewController.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/29/24.
//

import UIKit

class PopularCityViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var tableView: UITableView!
    
    let cityList:[City] = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        

    }
    func configureTableView() {
        
        tableView.rowHeight = 150
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib = UINib(nibName: "CityTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "CityTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell") as! CityTableViewCell
        
        let  data = cityList[indexPath.row]
        
      
        cell.configureCell(data: data)
        return cell
    }

   
}
