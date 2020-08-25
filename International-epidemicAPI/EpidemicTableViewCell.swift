//
//  EpidemicTableViewCell.swift
//  International-epidemicAPI
//
//  Created by 蕭聿莘 on 2020/8/23.
//

import UIKit

class EpidemicTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ourbreakDayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
