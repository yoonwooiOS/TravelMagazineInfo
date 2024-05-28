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
        citiyDetailTitleLabel.font = .boldSystemFont(ofSize: 18)
        citiyDetailDescriptionLabel.numberOfLines = 0
        citiyDetailDescriptionLabel.font = .systemFont(ofSize: 14)
        citiyDetailDescriptionLabel.textColor = .gray
        likeButton.tintColor = .white
    }
    
    func configureInfoCellLayout(data: Travel) {
        
        guard let urlstring = data.travel_image, let url = URL(string: urlstring), let grade = data.grade, let save = data.save, let like = data.like else {
            print("값 없음")
            return}
        
        citiyDetailImageView.kf.setImage(with: url)
        citiyDetailImageView.contentMode = .scaleAspectFill
        citiyDetailImageView?.layer.cornerRadius = 10
        
        citiyDetailTitleLabel.text = data.title
        
        citiyDetailDescriptionLabel.text = data.description
        
        citiyDetailGradeSaveBookmarkLabel.text = "평점별자리(\(grade)) · 저장 \(save)"
        
        likeButton.setImage(UIImage(systemName: like ? "heart.fill" : "heart"), for: .normal)
        
        
    }
    
}

