//
//  RestaurantTableViewController.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/25/24.
//

import UIKit
import Kingfisher

class RestaurantTableViewController: UITableViewController {
    
    let restaurantInfo:[Restaurant] = RestaurantList().restaurantArray
    var selectedRestaurantInfoList: [Restaurant] = []
    
    @IBOutlet var restaurantSearchTextField: UITextField!
    
    @IBOutlet var restaurantSearchButton: UIButton!
    
    @IBOutlet var koreanFoodButton: UIButton!
    
    @IBOutlet var japaneseFoodButton: UIButton!
    
    @IBOutlet var westernFoodButton: UIButton!
    
    @IBOutlet var chineseFoodButton: UIButton!
    
    @IBOutlet var otherButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 150
        restaurantSearchTextField.placeholder = "원하시는 식당을 입력해주세요!"
        
        buttonUiDesign(buttonName: restaurantSearchButton, buttonTitle: "검색", buttonTextColor: .white, buttonBackGroundColor: .systemBlue, titleLabelAlignment: .center)
        buttonUiDesign(buttonName: koreanFoodButton, buttonTitle: "한식", buttonTextColor: .white, buttonBackGroundColor: .systemPink, titleLabelAlignment: .center)
        buttonUiDesign(buttonName: japaneseFoodButton, buttonTitle: "일식", buttonTextColor: .white, buttonBackGroundColor: .systemOrange, titleLabelAlignment: .center)
        buttonUiDesign(buttonName: westernFoodButton, buttonTitle: "양식", buttonTextColor: .white, buttonBackGroundColor: .systemCyan, titleLabelAlignment: .center)
        buttonUiDesign(buttonName: chineseFoodButton, buttonTitle: "중식", buttonTextColor: .white, buttonBackGroundColor: .systemRed, titleLabelAlignment: .center)
        buttonUiDesign(buttonName: otherButton, buttonTitle: "경양식\n분식·디저트", buttonTextColor: .black, buttonBackGroundColor: .systemGray4, titleLabelAlignment: .center)
        
        
        selectedRestaurantInfoList = restaurantInfo
        
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedRestaurantInfoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Restaurant") as! RestaurantCustomCellTableViewCell
        
        
        
        let data = selectedRestaurantInfoList[indexPath.row]
        let url = URL(string: data.image)
        cell.menuImageView.kf.setImage(with: url)
        cell.menuImageView.contentMode = .scaleToFill
        cell.menuImageView.layer.cornerRadius = 7
        
        cell.restaurantNameLabel.text = data.name
        cell.restaurantNameLabel.font = .boldSystemFont(ofSize: 18)
        
        
        cell.restaurantAddressLabel.text = data.address
        cell.restaurantAddressLabel.font = .systemFont(ofSize: 14)
        cell.restaurantAddressLabel.textColor = .systemGray4
        cell.restaurantAddressLabel.numberOfLines = 0
        cell.restaurantPhoneNumberLabel.text = data.phoneNumber
        
        cell.restaurantPriceLabel.text = "\(data.price)원"
        
        cell.restaurantCategoryLabel.text = data.category
        cell.restaurantCategoryLabel.textColor = .white
        cell.restaurantCategoryLabel.layer.cornerRadius = 7
        cell.restaurantCategoryLabel.textAlignment = .center
        cell.restaurantCategoryLabel.backgroundColor = .systemPurple
        cell.restaurantCategoryLabel.layer.opacity = 0.8
        return cell
    }
    
    @IBAction func restaurantSearchButtonClicked(_ sender: UIButton) {
        guard let text = restaurantSearchTextField.text, text.count > 1 else {
            
            selectedRestaurantInfoList = restaurantInfo
            tableView.reloadData()
            
            return
            
        }
        
        print("버튼 눌림")
        var searchResult:[Restaurant] = []
        guard let searchTextField = restaurantSearchTextField.text else { 
            print("값 없음")
            return
            
        }
        let searchText = searchTextField
        
        for text in restaurantInfo {
            if text.name.contains(searchText) || text.category.contains(searchText) {

                searchResult.append(text)
                
            }
        }
        selectedRestaurantInfoList = searchResult
        tableView.reloadData()
        
    }
    
    @IBAction func koreanFoodButtonClicked(_ sender: UIButton) {
        var koreanFood:[Restaurant] = []
        
        for food in restaurantInfo {
            if food.category == "한식" {
                koreanFood.append(food)
            }
        }
        selectedRestaurantInfoList = koreanFood
        tableView.reloadData()
    }
    
    @IBAction func japaneseFoddButtonClicked(_ sender: UIButton) {
        var japaneseFood:[Restaurant] = []
        
        for food in restaurantInfo {
            if food.category == "일식" {
                japaneseFood.append(food)
            } 
        }
        selectedRestaurantInfoList = japaneseFood
        tableView.reloadData()
    }
    @IBAction func westernFoodButtonClicked(_ sender: UIButton) {
        
        var westernFood:[Restaurant] = []
        
        for food in restaurantInfo {
            if food.category == "양식" {
                westernFood.append(food)
            }
        }
        selectedRestaurantInfoList = westernFood
        tableView.reloadData()
        
    }
    
    
    @IBAction func chineseFoodButtonClicked(_ sender: UIButton) {
        
        var chineseFood:[Restaurant] = []
        
        for food in restaurantInfo {
            if food.category == "중식" {
                chineseFood.append(food)
            }
        }
        selectedRestaurantInfoList = chineseFood
        tableView.reloadData()
        
    }
    
    @IBAction func otherButtonClicked(_ sender: UIButton) {
        
        var otherFood:[Restaurant] = []
        
        for food in restaurantInfo {
            if food.category == "카페" || food.category == "경양식" || food.category == "분식" {
                otherFood.append(food)
            }
        }
        selectedRestaurantInfoList = otherFood
        tableView.reloadData()
        
    }
    func buttonUiDesign(buttonName name: UIButton, buttonTitle title: String, buttonTextColor: UIColor, buttonBackGroundColor: UIColor, titleLabelAlignment alignment:NSTextAlignment) {
        name.setTitle(title, for: .normal)
        name.titleLabel?.textAlignment = alignment
        name.tintColor = buttonTextColor
        name.backgroundColor = buttonBackGroundColor
        name.layer.cornerRadius = 7
        
        
    }
    
}
