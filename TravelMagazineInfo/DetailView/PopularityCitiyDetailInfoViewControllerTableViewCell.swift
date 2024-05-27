//
//  PopularityCitiyDetailInfoViewControllerTableViewCell.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/27/24.
//

import UIKit

class PopularityCitiyDetailInfoViewControllerTableViewCell: UITableViewCell {

    @IBOutlet var citiyDetailImageView: UIImageView!
    
    @IBOutlet var citiyDetailTitleLabel: UILabel!
    @IBOutlet var citiyDetailDescriptionLabel: UILabel!
    @IBOutlet var citiyDetailGradeSaveBookmarkLabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
       
    }
   
    func configureInfoCellLayout(data: Travel) {
        
        guard let urlstring = data.travel_image, let url = URL(string: urlstring) else {
            print("사진 없음")
            return}
        guard let grade = data.grade, let save = data.save else {
            print("값 없음")
            return}
        
        guard let like = data.like else { return }
        
        
        citiyDetailImageView.kf.setImage(with: url)
        citiyDetailImageView.contentMode = .scaleAspectFill
        citiyDetailImageView?.layer.cornerRadius = 10
        
        citiyDetailTitleLabel.text = data.title
        citiyDetailTitleLabel.font = .boldSystemFont(ofSize: 18)
        
        citiyDetailDescriptionLabel.text = data.description
        citiyDetailDescriptionLabel.numberOfLines = 0
        citiyDetailDescriptionLabel.font = .systemFont(ofSize: 14)
        citiyDetailDescriptionLabel.textColor = .gray
        
        citiyDetailGradeSaveBookmarkLabel.text = "평점별자리(\(grade)) · 저장 \(save)"
        citiyDetailGradeSaveBookmarkLabel.font = .systemFont(ofSize: 14)
        citiyDetailGradeSaveBookmarkLabel.textColor = .systemGray3
        
        
      likeButton.setImage(UIImage(systemName: like ? "heart.fill" : "heart"), for: .normal)
        likeButton.tintColor = .white
        
    }
    
    }

