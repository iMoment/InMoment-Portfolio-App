//
//  PostCell.swift
//  In Moment
//
//  Created by Stanley Pan on 2/18/16.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit
import Alamofire
import Firebase

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var showcaseImage: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var likeImage: UIImageView!
    
    var post: Post!
    var request: Request?
    var likeReference: Firebase!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: "likeTapped:")
        tap.numberOfTapsRequired = 1
        likeImage.addGestureRecognizer(tap)
        likeImage.userInteractionEnabled = true
    }

    override func drawRect(rect: CGRect) {
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        
        showcaseImage.clipsToBounds = true
    }
    
    func configureCell(post: Post, img: UIImage?) {
        self.post = post
        likeReference = DataService.ds.REF_USER_CURRENT.childByAppendingPath("likes").childByAppendingPath(post.postkey)
        
        self.descriptionText.text = post.postDescription
        self.likesLabel.text = "\(post.likes)"
        
        if post.imageUrl != nil {
            
            if img != nil {
                self.showcaseImage.image = img
            } else {
                request = Alamofire.request(.GET, post.imageUrl!).validate(contentType: ["image/*"]).response(completionHandler: { request, response, data, error in
                    
                    if error == nil {
                        let img = UIImage(data: data!)!
                        self.showcaseImage.image = img
                        FeedVC.imageCache.setObject(img, forKey: self.post.imageUrl!)
                    }
                })
            }
            
        } else {
            self.showcaseImage.hidden = true
        }
        
        likeReference.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            if let doesNotExist = snapshot.value as? NSNull {
                //  We have not like this specific post
                self.likeImage.image = UIImage(named: "Heart Empty")
            } else {
                self.likeImage.image = UIImage(named: "Heart Full")
            }
        })
    }
    
    func likeTapped(sender: UITapGestureRecognizer) {
        likeReference.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            if let doesNotExist = snapshot.value as? NSNull {
                self.likeImage.image = UIImage(named: "Heart Full")
                self.post.adjustLikes(true)
                self.likeReference.setValue(true)
                
            } else {
                self.likeImage.image = UIImage(named: "Heart Empty")
                self.post.adjustLikes(false)
                self.likeReference.removeValue()
            }
        })
    }
}







