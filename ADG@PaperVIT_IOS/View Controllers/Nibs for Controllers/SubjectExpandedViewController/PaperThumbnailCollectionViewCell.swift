//
//  PaperThumbnailCollectionViewCell.swift
//  ADG@PaperVIT_IOS
//
//  Created by Henit Work on 10/08/21.
//

import UIKit

class PaperThumbnailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var paperTitle: UILabel!
    @IBOutlet weak var slotTitle: UILabel!
    @IBOutlet weak var paperThumbnail: UIImageView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var baseView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        baseView.layer.cornerRadius = 20
        self.layer.cornerRadius = 20
        slotTitle.layer.cornerRadius = 3
        
        // Initialization code
    }

}
