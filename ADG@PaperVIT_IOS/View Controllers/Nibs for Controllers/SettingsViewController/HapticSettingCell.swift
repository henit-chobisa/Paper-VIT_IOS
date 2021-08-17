//
//  HapticSettingCell.swift
//  ADG@PaperVIT_IOS
//
//  Created by Vaibhav Shah on 17/08/21.
//

import UIKit

class HapticSettingCell: UITableViewCell {

    @IBOutlet var imageIcon: UIImageView!
    
    @IBOutlet var hapticToggle: UISwitch!
    
    @IBOutlet var settingNameLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func toggleSwitch(_ sender: Any) {
        
        if hapticToggle.isOn {
            defaults.setValue(true, forKey: key.values.hapticState)
        }else{
            defaults.setValue(false, forKey: key.values.hapticState)
        }
        
    }
    
    
}
