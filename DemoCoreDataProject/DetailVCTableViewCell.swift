//
//  DetailVCTableViewCell.swift
//  DemoCoreDataProject
//
//  Created by Test on 19/02/24.
//

import UIKit

class DetailVCTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var addressLabel: UILabel?
    @IBOutlet weak var cityLabel: UILabel?
    @IBOutlet weak var mobileLabel: UILabel?
    //@IBOutlet weak var expandCellImageView: UIImageView!
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var bottomStackView: UIStackView!

    
    static let cellIdentifier = String(describing: DetailVCTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
