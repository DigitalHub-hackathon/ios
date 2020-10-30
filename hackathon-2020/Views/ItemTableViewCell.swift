//
//  ItemTableViewCell.swift
//  hackathon-2020
//
//  Created by art-off on 30.10.2020.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ItemTableCell"
    static let nibName = "ItemTableViewCell"
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var forYouView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //containerView.roundCorner(corners: [.topLeft, .bottomLeft, .bottomRight], radius: 15)
        //containerView.roundCorner(corners: [.topLeft, .bottomLeft, .bottomRigth], radius: 15)
        //forYouView.roundCorner(corners: [.topRight, .topLeft], radius: 5)
        
        containerView.layer.cornerRadius = 15
        forYouView.layer.cornerRadius = 10
    }
    
}
