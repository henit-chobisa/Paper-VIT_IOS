//
//  PaperPreviewViewController.swift
//  ADG@PaperVIT_IOS
//
//  Created by Henit Work on 10/08/21.
//

import UIKit

class PaperPreviewViewController: UIViewController {

    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var paperPreviewDummyImage: UIImageView!
    @IBOutlet weak var paperSlotLable: UILabel!
    var paperTitle : String = "Paper"
    var slot : String = "Slot"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = paperTitle
        paperSlotLable.text = slot
        downloadButton.layer.cornerRadius = 20
        paperPreviewDummyImage.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapDownloadButton(_ sender: UIButton) {
    }
    
    
}
