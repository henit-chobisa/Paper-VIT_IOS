//
//  PaperPreviewViewController.swift
//  ADG@PaperVIT_IOS
//
//  Created by Henit Work on 10/08/21.
//

import UIKit
import WebKit
class PaperPreviewViewController: UIViewController, URLSessionDelegate {

    @IBOutlet weak var pdfWebView: WKWebView!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var paperSlotLable: UILabel!
    var paperTitle : String = "Paper"
    var slot : String = "Slot"
    var url : String = "https://storage.googleapis.com/papervit-upload.appspot.com/2f61c10ddf35773652a69d03b7269d8539abaa50.pdf"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = paperTitle
        paperSlotLable.text = slot
        downloadButton.layer.cornerRadius = 20
        let pdfRequest = URLRequest(url: URL(string: url)!)
        pdfWebView.load(pdfRequest)
    }
    
    @IBAction func didTapDownloadButton(_ sender: UIButton) {
       
        DispatchQueue.main.async {
            let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
            let downloadTask = urlSession.downloadTask(with: URL(string: self.url)!)
            downloadTask.resume()
        }
        
    }
    
}
