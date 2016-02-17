//
//  PostCell.swift
//  In Moment
//
//  Created by Stanley Pan on 2/18/16.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var showcaseImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func drawRect(rect: CGRect) {
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        
        showcaseImage.clipsToBounds = true
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
