//
//  settingsCell.swift
//  ADG@PaperVIT_IOS
//
//  Created by Vaibhav Shah on 11/08/21.
//

import UIKit

class settingsCell: UITableViewCell {

    @IBOutlet var hapticToggle: UISwitch!
    
    @IBOutlet var imageIcon: UIImageView!
    
    @IBOutlet var settingNameLabel: UILabel!
    
    let defaults = UserDefaults.standard

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
        
        //MARK: - !!CHECK THIS!! 
//                let state = defaults.object(forKey: key.values.hapticState)! as! Bool
//                if state {
//                    hapticToggle.setOn(true, animated: true)
//
//                }else{
//                    hapticToggle.setOn(false, animated: true)
//
//                }
        
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


