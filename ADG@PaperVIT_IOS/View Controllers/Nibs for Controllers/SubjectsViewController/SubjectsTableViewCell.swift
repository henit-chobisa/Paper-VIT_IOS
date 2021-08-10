//
//  SubjectsTableViewCell.swift
//  ADG@PaperVIT_IOS
//
//  Created by Henit Work on 10/08/21.
//

import UIKit

class SubjectsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var courseShortLabel: UILabel!
    @IBOutlet weak var courseLongLabel: UILabel!
    @IBOutlet weak var courseCode: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bookmarkButton.setImage(#imageLiteral(resourceName: "starHollowLight"), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func didTapBookmarkButton(_ sender: UIButton) {
        if (sender.currentImage == #imageLiteral(resourceName: "starHollowLight")){
            sender.setImage(#imageLiteral(resourceName: "starFill"), for: .normal)
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "starHollowLight"), for: .normal)
        }
    }
    
}
