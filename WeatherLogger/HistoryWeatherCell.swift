//
//  HistoryWeatherCell.swift
//  WeatherLogger
//
//  Created by Hassan Ahmed on 02/03/2020.
//  Copyright © 2020 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit

class HistoryWeatherCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    
    @IBOutlet weak var imag: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
