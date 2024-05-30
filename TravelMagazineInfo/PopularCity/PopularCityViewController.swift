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
    var filteredList:[City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredList = cityList
        
        configureTableView()
        configureSegmentedControl()
        
    }
    
    func configureTableView() {
        
        tableView.rowHeight = 150
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib = UINib(nibName: "CityTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "CityTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell") as! CityTableViewCell
        
        let  data = filteredList[indexPath.row]
        
        cell.configureCell(data: data)
        
        return cell
    }
    
    func configureSegmentedControl(){
        
        segmentedControl.selectedSegmentIndex = 3
        segmentedControl.setTitle("모두", forSegmentAt: 0)
        segmentedControl.setTitle("국내", forSegmentAt: 1)
        segmentedControl.setTitle("해외", forSegmentAt: 2)
        
    }
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        
        var locationList:[City] = []
        
        if segmentedControl.selectedSegmentIndex == 0 {
            
            filteredList = cityList
            
        } else if segmentedControl.selectedSegmentIndex == 1 {
            
            for city in CityInfo().city {
                if city.domestic_travel {
                    
                    locationList.append(city)
                    
                }
            }
            filteredList = locationList
        } else  {
            for city in CityInfo().city {
                if city.domestic_travel == false  {
                    
                    locationList.append(city)
                    
                }
            }
            filteredList = locationList
        }
        //        for city in CityInfo().city {
        //
        //            if city.domestic_travel {
        //                domesticList.append(city)
        ////                print(domesticList ,"국내")
        //            } else  {
        //                overseasList.append(city)
        ////                print(overseasList ,"해외")
        //            }
        //        }
        //        if segmentedControl.selectedSegmentIndex == 0 {
        //            filteredList = cityList
        //        } else if segmentedControl.selectedSegmentIndex == 1 {
        //            filteredList = domesticList
        //            print(filteredList,"1번 세그를 눌렀을 때 도시들")
        //        } else  {
        //            filteredList = overseasList
        //        }
        
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
}
