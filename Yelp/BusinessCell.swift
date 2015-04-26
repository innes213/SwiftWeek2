//
//  BusinessCell.swift
//  Yelp
//
//  Created by Rob Hislop on 4/26/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var business: Business! {
        didSet {
            nameLabel.text = business.name
            thumbImage.setImageWithURL(business.imageURL)
            categoriesLabel.text = business.categories
            ratingImage.setImageWithURL(business.ratingImageURL)
            reviewCountLabel.text = "\(business.reviewCount!) Reviews"
            addressLabel.text = business.address
            distanceLabel.text = business.distance
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbImage.layer.cornerRadius = 20
        thumbImage.clipsToBounds = true
        
        // This label will wrap so we need to make sure it wraps right
        //nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        //nameLabel.preferredMaxLayoutWidth = nameLabel.bounds.width
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // This label will wrap so we need to make sure it wraps right
        //nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        //nameLabel.preferredMaxLayoutWidth = nameLabel.bounds.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
