//
//  ItemTableViewCell.swift
//  hackathon-2020
//
//  Created by art-off on 30.10.2020.
//

import UIKit

class ForYouItemTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ForYouItemTableCell"
    static let nibName = "ForYouItemTableViewCell"
    
    var delegate: ShowingAlertDelegate?
    
    // MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var forYouView: UIView!
    @IBOutlet weak var forYouLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var goButton: UIButton!
    
    var id: Int = 0
    
    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.backgroundColor = Colors.purple
        forYouView.backgroundColor = Colors.red
        
        containerView.makeShadow(radius: 6, color: .black, opacity: 0.25)
        containerView.layer.cornerRadius = 15
        forYouView.layer.cornerRadius = 10
        forYouView.layer.opacity = 0.9
        
        goButton.backgroundColor = Colors.gerbRed
        goButton.layer.cornerRadius = 15
    }
    
    @IBAction func goButtonTapped(_ sender: Any) {
        delegate?.showAlert(withText: "Отлично!", id: id)
    }
    
}
