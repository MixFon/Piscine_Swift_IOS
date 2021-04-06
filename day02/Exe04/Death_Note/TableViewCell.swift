//
//  TableViewCell.swift
//  Death_Note
//
//  Created by Михаил Фокин on 26.11.2020.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var namePerson: UILabel!
    @IBOutlet var datePerson: UILabel!
    @IBOutlet var descriptionPersnon: UILabel!
    
    // Размещают настройки
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
