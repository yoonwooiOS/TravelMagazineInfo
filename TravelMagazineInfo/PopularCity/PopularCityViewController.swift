//
//  PopularCityViewController.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/29/24.
//

import UIKit

class PopularCityViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var tableView: UITableView!
    
    let cityList:[City] = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureSegmentedControl()
        
    }
    
    
    func configureSegmentedControl(){
        
        segmentedControl.selectedSegmentIndex = 3
        segmentedControl.setTitle("모두", forSegmentAt: 0)
        segmentedControl.setTitle("국내", forSegmentAt: 1)
        segmentedControl.setTitle("해외", forSegmentAt: 2)
        
        
        
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
