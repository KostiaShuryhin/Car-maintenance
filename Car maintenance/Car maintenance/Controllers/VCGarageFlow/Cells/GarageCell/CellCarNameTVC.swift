//
//  CellCarNameTVC.swift
//  Car maintenance
//
//  Created by Константин on 20.09.21.
//

import UIKit

class CellCarNameTVC: UITableViewCell {
    
    @IBOutlet weak var titleOfCell: UILabel!
    @IBOutlet weak var itemeOfCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
