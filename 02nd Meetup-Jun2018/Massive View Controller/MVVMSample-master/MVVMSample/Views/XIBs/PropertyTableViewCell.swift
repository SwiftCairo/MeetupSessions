//
//  PropertyTableViewCell.swift
//  MVVMSample
//
//  Created by Hesham on 6/20/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit
import Kingfisher

class PropertyTableViewCell: UITableViewCell {

    //MARK: - UIOutlets
    @IBOutlet weak var propertyImageView: UIImageView!
    @IBOutlet weak var propertyTitleLabel: UILabel!
    @IBOutlet weak var propertySubjectLabel: UILabel!
    @IBOutlet weak var propertyTypeLabel: UILabel!
    @IBOutlet weak var propertyPriceLabel: UILabel!
    
    //MARK: - Cell lifecycle and functions
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        propertyImageView.image = nil
        propertyTitleLabel.text = ""
        propertySubjectLabel.text = ""
        propertyTypeLabel.text = ""
        propertyPriceLabel.text = ""
    }
    
    //MARK: - Cell setup
    func setupCell(WithProperty property: PropertyViewModel) {
        propertyImageView.kf.indicatorType = .activity
        propertyImageView.kf.setImage(with: URL(string: property.imageURL), placeholder: nil, options: [.transition(.fade(0.5))], progressBlock: nil, completionHandler: nil)
        propertyTitleLabel.text = property.title
        propertySubjectLabel.text = property.subject
        propertyTypeLabel.text = property.type
        propertyPriceLabel.text = property.price
    }
}
