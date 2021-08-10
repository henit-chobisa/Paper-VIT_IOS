//
//  ViewController.swift
//  ADG@PaperVIT_IOS
//
//  Created by Henit Work on 10/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var getStartedButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        getStartedButton.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapGetStarted(_ sender: UIButton) {
        
    }
    

}

