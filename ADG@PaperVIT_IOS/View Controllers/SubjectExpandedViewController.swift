//
//  SubjectExpandedViewController.swift
//  ADG@PaperVIT_IOS
//
//  Created by Henit Work on 10/08/21.
//

import UIKit

class SubjectExpandedViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var papersCollectionView: UICollectionView!
    var SubjectTitle : String = "Subject"
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = SubjectTitle
    }
    
    struct Paper {
        var title : String
        var slot : String
        var thumbnail : UIImage
    }
    
    var papers : [Paper] = [Paper(title: "Winter 2019-20", slot: "B1-TB1", thumbnail: #imageLiteral(resourceName: "Screenshot 2021-03-22 at 5.28 1")), Paper(title: "Winter 2019-20", slot: "B1-TB1", thumbnail: #imageLiteral(resourceName: "Screenshot 2021-03-22 at 5.28 1")), Paper(title: "Winter 2019-20", slot: "B1-TB1", thumbnail: #imageLiteral(resourceName: "Screenshot 2021-03-22 at 5.28 1")), Paper(title: "Winter 2019-20", slot: "B1-TB1", thumbnail: #imageLiteral(resourceName: "Screenshot 2021-03-22 at 5.28 1"))]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        papersCollectionView.dataSource = self
        papersCollectionView.delegate = self
        papersCollectionView.register(UINib(nibName: "PaperThumbnailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "paperCell")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toPaperView"){
            if let sender = sender as? Paper {
                if let VC = segue.destination as? PaperPreviewViewController {
                    VC.paperTitle = sender.title
                    VC.slot = sender.slot
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toPaperView", sender: papers[indexPath.row])
    }
}

extension SubjectExpandedViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = papersCollectionView.dequeueReusableCell(withReuseIdentifier: "paperCell", for: indexPath) as! PaperThumbnailCollectionViewCell
        cell.paperTitle.text = papers[indexPath.row].title
        cell.slotTitle.text = papers[indexPath.row].slot
        cell.paperThumbnail.image = papers[indexPath.row].thumbnail
        return cell
    }
}
