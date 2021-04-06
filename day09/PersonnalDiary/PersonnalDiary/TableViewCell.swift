//
//  TableViewCell.swift
//  PersonnalDiary
//
//  Created by Михаил Фокин on 05.12.2020.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var titleCell: UILabel!
    @IBOutlet var descriptinCell: UILabel!
    
    @IBOutlet var imageCell: UIImageView!
    @IBOutlet var dateCreation: UILabel!
    //@IBOutlet var imageCell: UIImageView!
    @IBOutlet var dateModification: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
