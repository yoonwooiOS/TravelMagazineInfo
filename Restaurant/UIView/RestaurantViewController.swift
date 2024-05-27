//
//  RestaurantViewController.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/28/24.
//

import UIKit
import Kingfisher


class RestaurantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    
    
    @IBOutlet var navigationTitle: UINavigationItem!
    
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var todayRecommandButton: UIButton!
    
    @IBOutlet var costEffectivebutton: UIButton!
    @IBOutlet var foodTableView: UITableView!
    
    var restaurant:[Restaurant] = RestaurantList().restaurantArray
    var filteredList: [Restaurant] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationTitle.title = "오늘의 메뉴"
        
        barButtonItemsUI()
        buttonDesignUi(buttonName: todayRecommandButton, title: "오늘의 추천", buttonColor: .systemGreen)
        buttonDesignUi(buttonName: costEffectivebutton, title: "가성비 맛집", buttonColor: .brown)
        
        filteredList = restaurant
        
        foodTableView.rowHeight = 150
        foodTableView.dataSource = self
        foodTableView.delegate = self
        
        let xib = UINib(nibName: "RestaurantTableViewCell", bundle: nil)
        foodTableView.register(xib, forCellReuseIdentifier: "RestaurantTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell
        let data = filteredList[indexPath.row]
        let urlString = URL(string: data.image)
        
        cell.menuImage.kf.setImage(with: urlString)
        cell.menuImage.contentMode = .scaleAspectFill
        cell.configureFoodCell(data:data)
        
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        var searchList:[Restaurant] = []
        
        for food in restaurant {
            
            if food.name.contains(searchBar.text!) || food.category.contains(searchBar.text!) {
                
                searchList.append(food)
            }
        }
        filteredList = searchList
        foodTableView.reloadData()
    }
    
    @objc func koreaFoodButtonClicked() {
        
        var koreanFood: [Restaurant] = []
        
        for food in restaurant {
            if food.category == "한식" {
                koreanFood.append(food)
            }
            
        }
        
        filteredList = koreanFood
        foodTableView.reloadData()
    }
    @objc func japaneseFoodButtonClicked() {
        
        var japaneseFood: [Restaurant] = []
        
        for food in restaurant {
            if food.category == "일식" {
                japaneseFood.append(food)
            }
            
        }
        
        filteredList = japaneseFood
        foodTableView.reloadData()
    }
    @objc func chineseFoodButtonClicked() {
        
        var chineseFood: [Restaurant] = []
        
        for food in restaurant {
            if food.category == "중식" {
                chineseFood.append(food)
            }
            
        }
        
        filteredList = chineseFood
        foodTableView.reloadData()
    }
    @objc func westernFoodButtonClicked() {
        
        var westernFood: [Restaurant] = []
        
        for food in restaurant {
            if food.category == "양식" {
                westernFood.append(food)
            }
            
        }
        
        filteredList = westernFood
        foodTableView.reloadData()
    }
    
    func barButtonItemColor(name: UIBarButtonItem, UIBarButtonItemTintColor color:UIColor) {
        name.tintColor = color
        
    }
    
    func barButtonItemsUI() {
        let koreanFood = UIBarButtonItem(title: "한식", style: .plain, target: self, action: #selector(koreaFoodButtonClicked))
        let japaneseFood = UIBarButtonItem(title: "일식", style: .plain, target: self, action: #selector(japaneseFoodButtonClicked))
        let chineseFood = UIBarButtonItem(title: "중식", style: .plain, target: self, action: #selector(chineseFoodButtonClicked))
        let westernFood = UIBarButtonItem(title: "양식", style: .plain, target: self, action: #selector(westernFoodButtonClicked))
        
        barButtonItemColor(name: koreanFood, UIBarButtonItemTintColor: .systemCyan)
        barButtonItemColor(name: japaneseFood, UIBarButtonItemTintColor: .systemPink)
        barButtonItemColor(name: chineseFood, UIBarButtonItemTintColor: .systemRed)
        barButtonItemColor(name: westernFood, UIBarButtonItemTintColor: .systemBlue)
        
        navigationItem.leftBarButtonItems = [koreanFood, japaneseFood]
        navigationItem.rightBarButtonItems = [chineseFood, westernFood]
    }
    
    @IBAction func recommandButtonClicked(_ sender: UIButton) {
        var randomFood:[Restaurant] = []
        guard let randomElement = restaurant.randomElement() else { return }
        
        randomFood.append(randomElement)
        filteredList = randomFood
        print(randomElement)
        
        foodTableView.reloadData()
    }
    
    @IBAction func costEffectivebuttonClicked(_ sender: UIButton) {
        var costEffectiveRestaurant:[Restaurant] = []
       
        for cost in restaurant {
            if cost.price < 10000 {
                costEffectiveRestaurant.append(cost)
            }
        }
        filteredList = costEffectiveRestaurant
        foodTableView.reloadData()
        
    }
    
    func buttonDesignUi(buttonName:UIButton, title:String, buttonColor color:UIColor){
        buttonName.setTitle(title, for: .normal)
        buttonName.titleLabel?.font = .systemFont(ofSize: 12)
        buttonName.tintColor = .white
        buttonName.backgroundColor = color
        buttonName.layer.cornerRadius = 10
    }
    
}
