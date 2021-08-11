//
//  SettingsViewController.swift
//  ADG@PaperVIT_IOS
//
//  Created by Vaibhav Shah on 11/08/21.
//

import UIKit

class SettingsViewController: UIViewController {

    var sectionHeaders:[String] = ["General", "Stay In Touch", "Others"]
    var settings = [["Appearance", "Notifications", "Haptics"], ["Contact Us", "Share with Peers", "Our Instagram", "Our Twitter", "Our Facebook", "Our LinkedIn"], ["About Us", "Privacy Policy"]]
    var settingIcons = [["appearanceIcon", "notificationsIcon", "hapticsImage"], ["contactIcon", "shareIcon", "instaIcon", "twitterIcon", "fbIcon", "linkedinIcon"], ["aboutIcon", "privacyIcon"]]
    
    @IBOutlet var settingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


}
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaders.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! settingsCell
        
        
        if indexPath.section == 0 && indexPath.row == 2{
            let cell  = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! settingsCell
            cell.settingNameLabel.text = settings[indexPath.section][indexPath.row]
            cell.imageIcon.image = UIImage(named: settingIcons[indexPath.section][indexPath.row])
            return cell
        }
        
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! settingsCell
            cell.settingNameLabel.text = settings[indexPath.section][indexPath.row]
            cell.imageIcon.image = UIImage(named: settingIcons[indexPath.section][indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .clear
    }
    

}
