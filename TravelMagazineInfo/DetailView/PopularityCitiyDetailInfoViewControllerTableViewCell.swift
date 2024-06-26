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
    
    @IBOutlet var bookmarkButton: UIButton!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        citiyDetailTitleLabel.titlePrimaryLabel(textAlignment: .left, fontSize: 18, textColor: .black)
        citiyDetailDescriptionLabel.subtitlePrimaryLabel(textAlignment: .left, fontSize: 14, textColor: .gray)
        
    }
    
    func configureInfoCell(data: Travel) {
        guard let urlstring = data.travel_image, let _ = URL(string: urlstring), let grade = data.grade, let save = data.save, let like = data.like else {
            print("값 없음")
            return }
        
        citiyDetailImageView.primaryImageView(urlString: urlstring, contendMode: .scaleToFill, cornerRadius: 10)
        
        citiyDetailTitleLabel.text = data.title
        
        citiyDetailDescriptionLabel.text = data.description
        
        citiyDetailGradeSaveBookmarkLabel.text = "평점별자리(\(grade)) · 저장 \(save)"
        
        let systemImage = like ? "heart.fill" : "heart"
        
        bookmarkButton.primaryButton(imageName: systemImage, imageTitle: "", backgroundColor: .clear, tintColor: .systemPink, cornerRaius: .zero)
        
    }
    
}

