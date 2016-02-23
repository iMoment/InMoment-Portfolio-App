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
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var likesLabel: UILabel!
    
    var post: Post!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func drawRect(rect: CGRect) {
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        
        showcaseImage.clipsToBounds = true
    }
    
    func configureCell(post: Post) {
        self.post = post
        self.descriptionText.text = post.postDescription
        self.likesLabel.text = "\(post.likes)"
    }
}
