//
//  PaperThumbnailCollectionViewCell.swift
//  ADG@PaperVIT_IOS
//
//  Created by Henit Work on 10/08/21.
//

import UIKit
import WebKit

class PaperThumbnailCollectionViewCell: UICollectionViewCell {

    var urlString : String = "https://www.google.com"
    @IBOutlet weak var webViewOutlet: WKWebView!
    @IBOutlet weak var paperTitle: UILabel!
    @IBOutlet weak var slotTitle: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var baseView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        baseView.layer.cornerRadius = 20
        self.layer.cornerRadius = 20
        slotTitle.layer.cornerRadius = 3
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webViewOutlet.load(request)
        webViewOutlet.allowsBackForwardNavigationGestures = false
      
        // Initialization code
    }

}
