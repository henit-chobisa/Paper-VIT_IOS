//
//  UploadPaperViewController.swift
//  ADG@PaperVIT_IOS
//
//  Created by Henit Work on 10/08/21.
//

import UIKit

class UploadPaperViewController: UIViewController {

    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var progressViewIndicator: CircularProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        progressViewIndicator.outterCircleWidth = 36.5
        progressViewIndicator.innerCircleWidth = 35.5
        progressViewIndicator.progressCircleColour = #colorLiteral(red: 0.2549019608, green: 0.05882352941, blue: 0.8078431373, alpha: 1)
        progressViewIndicator.fillCircleColour = #colorLiteral(red: 0.5766911507, green: 0.6609275937, blue: 1, alpha: 1)
        uploadButton.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapUploadPdf(_ sender: Any) {
        progressViewIndicator.progressAnimation(duration: 10, value: 1)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
