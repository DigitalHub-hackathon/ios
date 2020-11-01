//
//  ItemTableViewCell.swift
//  hackathon-2020
//
//  Created by art-off on 31.10.2020.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    static let reuseIdentifier = "ItemTableCell"
    static let nibName = "ItemTableViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.backgroundColor = Colors.purple
        
        containerView.makeShadow(radius: 6, color: .black, opacity: 0.25)
        containerView.layer.cornerRadius = 15
    }
    
}
