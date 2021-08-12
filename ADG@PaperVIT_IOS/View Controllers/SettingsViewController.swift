//
//  SettingsViewController.swift
//  ADG@PaperVIT_IOS
//
//  Created by Vaibhav Shah on 11/08/21.
//

import UIKit
import MessageUI

class SettingsViewController: UIViewController {
 
    var sectionHeaders:[String] = ["General", "Stay In Touch", "Others"]
    var settings = [["Appearance", "Haptics"], ["Contact Us", "Share with Peers", "Our Instagram", "Our Twitter", "Our Facebook", "Our LinkedIn"], ["About Us", "Privacy Policy"]]
    var settingIcons = [["appearanceIcon", "hapticsImage"], ["contactIcon", "shareIcon", "instaIcon", "twitterIcon", "fbIcon", "linkedinIcon"], ["aboutIcon", "privacyIcon"]]
    
    @IBOutlet var settingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


}


//MARK:- Tableview Methods
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
        
        
        if indexPath.section == 0 && indexPath.row == 1{
            let cell  = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! settingsCell
            cell.settingNameLabel.text = settings[indexPath.section][indexPath.row]
            cell.imageIcon.image = UIImage(named: settingIcons[indexPath.section][indexPath.row])
            cell.isSelected = false
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }
        
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! settingsCell
            cell.settingNameLabel.text = settings[indexPath.section][indexPath.row]
            cell.imageIcon.image = UIImage(named: settingIcons[indexPath.section][indexPath.row])
            cell.isSelected = false
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .clear
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let CellNo = Int("\(indexPath.section)\(indexPath.row)")
        performTask(cellNo: CellNo!)
    }
}


//MARK:- Tableview cell functions

    extension SettingsViewController {
        func performTask(cellNo: Int){
          switch cellNo {
          case 0:
            print("Change Appearance")
          case 1:
            checkDeviceAndShowHaptic()
          case 10:
            ContactUs()
          case 11:
            checkDeviceAndShare()
          case 12:
            socialMediaLinks(link: "https://instagram.com/adgvit?igshid=wn2wc0v4adzk")
          case 13:
            socialMediaLinks(link: "https://twitter.com/adgvit?s=11")
          case 14:
            socialMediaLinks(link: "https://www.facebook.com/vitios/")
          case 15:
            socialMediaLinks(link: "https://www.linkedin.com/company/adgvit/mycompany/")
          case 20:
            self.performSegue(withIdentifier: "aboutUs", sender: nil)
          case 21:
            self.performSegue(withIdentifier: "privacy", sender: nil)
          default:
                print("Error")
          }
        }
    }


//MARK:- Contact Us
extension SettingsViewController: MFMailComposeViewControllerDelegate {
    
    
    func ContactUs() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["papervit.adg@gmail.com"])
        composer.setSubject("Hey Paper-VIT Team")
        composer.setMessageBody("Your app is good but....help!", isHTML: false)
        present(composer, animated: true)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true, completion: nil)
            return
        }
        switch result {
        case .cancelled:
            print("cancelled")
        case .failed:
            print("failed")
        case .saved:
            print("saved")
        case .sent:
            print("sent")
        @unknown default:
            print("other error")
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
    //MARK:- Share App
    
    func shareApp() {
        let firstActivityItem = "Paper-VIT 2021"
        //MARK:- !!!!App link to be added here!!!!
        let secondActivityItem : NSURL = NSURL(string: "https://apps.apple.com/in/app/adg-connect/id1569965702")!
        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [firstActivityItem, secondActivityItem], applicationActivities: nil)
        activityViewController.activityItemsConfiguration = [
            UIActivity.ActivityType.message
        ] as? UIActivityItemsConfigurationReading
        activityViewController.isModalInPresentation = true
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    //MARK:- Checking device before assiging share app
    func checkDeviceAndShare() {
        let device = UIDevice.current.userInterfaceIdiom
        if device == .pad || device == .mac || device == .unspecified {
            alertController(title: "Share App!", message: "Feature not available.")
        }else{
            self.shareApp()
        }
    }
    
    //MARK:- Checking device before assiging changing haptic settings
    func checkDeviceAndShowHaptic() {
        let device = UIDevice.current.userInterfaceIdiom
        if device == .pad || device == .mac || device == .unspecified {
            alertController(title: "Haptic Feedback!", message: "Your device do not support Haptic Feedback.")
        }else{
            return
        }
    }
}

    //MARK:- open URL method
    func socialMediaLinks(link: String) {
        UIApplication.shared.open(URL(string: link)! as URL, options: [:], completionHandler: nil)
    }


//MARK:- AlertView
  extension SettingsViewController {
    func alertController(title:String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okBtn)
        okBtn.setValue(UIColor.yellow, forKey: "titleTextColor")
        self.present(alert, animated: true, completion: nil)
    }
}



