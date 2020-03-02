//
//  CurrentWeatherCell.swift
//  WeatherLogger
//
//  Created by Hassan Ahmed on 02/03/2020.
//  Copyright © 2020 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit
import AlamofireImage

class CurrentWeatherCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    
    @IBOutlet weak var imag: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var model: Result? {
        didSet {
            if let model = model {
                self.dateLabel.text = "\(model.date!.format()!)"
                self.tempLabel.text = "\(model.main.temp)"
                self.feelsLikeLabel.text = "Feels like \(model.main.feels_like)"
                
                self.desLabel.text = model.weather.description
                if let url = URL(string: "\(Environment.baseImageURL)\(model.weather.icon)@2x.png") {
                    self.imag.af.setImage(withURL: url)
                }
            }
        }
    }

}
