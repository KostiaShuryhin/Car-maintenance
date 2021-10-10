//
//  CellButtonTVC.swift
//  Car maintenance
//
//  Created by Константин on 20.09.21.
//

import UIKit

class CellButtonTVC: UITableViewCell {

    @IBOutlet weak var delBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    
    @IBAction func delCarBtn(_ sender: Any) {
    }
    
    @IBAction func saveCarSettingsBtn(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
