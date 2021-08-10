//
//  ExamSelectionTableViewCell.swift
//  ADG@PaperVIT_IOS
//
//  Created by Henit Work on 10/08/21.
//

import UIKit

class ExamSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var forewardIconButton: UIButton!
    @IBOutlet weak var examSubTitle: UILabel!
    @IBOutlet weak var examTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
}
