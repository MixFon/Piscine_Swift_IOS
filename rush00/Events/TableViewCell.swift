//
//  TableViewCell.swift
//  Death_Note
//
//  Created by Михаил Фокин on 26.11.2020.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var nameEvent: UILabel!
    @IBOutlet var locationEvent: UILabel!
    @IBOutlet var maxRegistredGuests: UILabel!
    @IBOutlet var currentRrgistredGuests: UILabel!
    @IBOutlet var typeEvemtCell: UILabel!
    @IBOutlet var durationCell: UILabel!
    @IBOutlet var descriptionCell: UILabel!
    @IBOutlet var startingTimeCell: UILabel!
    @IBOutlet var endTimeCell: UILabel!
    @IBAction func buttonOk(_ sender: UIButton) {
        
    }
    
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
