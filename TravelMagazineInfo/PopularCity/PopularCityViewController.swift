//
//  PopularCityViewController.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/29/24.
//

import UIKit
enum TravelType {
    case all
    case domestic
    case international
}
class PopularCityViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var tableView: UITableView!
    
    let cityList:[City] = CityInfo().city
    var filteredList:[City] = [] {
        
        didSet {
            
            tableView.reloadData()
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "인기 도시"
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
        //        let filterType: TravelType
        
        //        switch segmentedControl.selectedSegmentIndex {
        //        case 0:
        //            filterType = .all
        //        case 1:
        //            filterType = .domestic
        //        case 2:
        //            filterType = .international
        //        default:
        //            print("Error")
        //        }
        //
        //        switch filterType {
        //        case .all:
        //            filteredList = cityList
        //        case .domestic:
        //            for city in CityInfo().city {
        //                if city.domestic_travel {
        //                    locationList.append(city)
        //                }
        //            }
        //        case .international:
        //            for city in CityInfo().city {
        //                if !city.domestic_travel {
        //                    locationList.append(city)
        //                }
        //            }
        //
        //        }
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
        //
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchText = searchBar.text , !searchText.isEmpty else {
            print("값없음")
            return
        }
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            var filteredCities: [City] = []
            for city in cityList {
                if city.city_name.contains(searchText) || city.city_english_name.contains(searchText) {
                    filteredCities.append(city)
                }
            }
            filteredList = filteredCities
        case 1:
            var domesticList: [City] = []
            for city in cityList {
                if city.domestic_travel && (city.city_name.contains(searchText) || city.city_english_name.contains(searchText)) {
                    domesticList.append(city)
                }
            }
            filteredList = domesticList
        case 2:
            var locationList: [City] = []
            for city in cityList {
                if !city.domestic_travel && (city.city_name.contains(searchText) || city.city_english_name.contains(searchText)) {
                    locationList.append(city)
                }
            }
            filteredList = locationList
        default:
            print("Error")
        }
        
    }
    
}
