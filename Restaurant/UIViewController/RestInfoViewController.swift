//
//  RestInfoViewController.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/28/24.
//

import UIKit
import Kingfisher

class RestInfoViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
   
    @IBOutlet var navigationTitle: UINavigationItem!
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var todayRecommandButton: UIButton!
    
    @IBOutlet var costEffectivenessButton: UIButton!
    
    let resList:[Restaurant] = RestaurantList().restaurantArray
    var filteredList:[Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle.title = "오늘 뭐 먹지?"
        configureTableView()
        
        filteredList = resList
        
        let left = UIBarButtonItem(title: "한식", style: .plain, target:self , action: #selector(koreanFoodButtonClicked))
        let all = UIBarButtonItem(title: "전체 식당 보기", style: .plain, target: self, action: #selector(allResButtonClicked))
        
        navigationItem.leftBarButtonItem = left
        navigationItem.rightBarButtonItem = all
        
        buttonUiDesign(buttonName: todayRecommandButton, buttonTitle: "오늘의 추천 식당", tintColor: .white, backgroundColor: .systemGreen)
        buttonUiDesign(buttonName: costEffectivenessButton, buttonTitle: "가성비 맛집", tintColor: .white, backgroundColor: .systemBlue)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestInfoTableViewCell", for: indexPath) as! RestInfoTableViewCell
        let data = filteredList[indexPath.row]
        
        cell.configureCell(data:data)
        
        return cell
    }

    func configureTableView() {
        tableView.rowHeight = 160
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib = UINib(nibName: "RestInfoTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "RestInfoTableViewCell")
    }
    
    func buttonUiDesign(buttonName name:UIButton, buttonTitle title:String, tintColor:UIColor, backgroundColor bgcolor:UIColor) {
        name.setTitle(title, for: .normal)
        name.tintColor = tintColor
        name.backgroundColor = bgcolor
        name.layer.cornerRadius = 10
    }

    @objc func koreanFoodButtonClicked() {
        var koreaFood:[Restaurant] = []
        
        for food in resList {
            if food.category == "한식" {
                koreaFood.append(food)
            }
            
        }
        filteredList = koreaFood
        tableView.reloadData()
        
    }
    
    @objc func allResButtonClicked(){
        
        filteredList = resList
        tableView.reloadData()
    }
    
    @IBAction func todayRecommandButtonClicked(_ sender: UIButton) {
        var randomFoodList: [Restaurant] = []
        guard let randomElement = resList.randomElement() else { return }
        randomFoodList.append(randomElement)
        filteredList = randomFoodList
        tableView.reloadData()
        
    }
    
    @IBAction func costEffectivenessButtonClicked(_ sender: UIButton) {
    var costEffectivenessList:[Restaurant] = []
        for food in resList {
           if food.price < 10000 {
                costEffectivenessList.append(food)
            }
            filteredList = costEffectivenessList
            tableView.reloadData()
            
        }
    }
    
}
