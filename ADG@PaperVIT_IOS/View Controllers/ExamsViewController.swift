//
//  ExamsViewController.swift
//  ADG@PaperVIT_IOS
//
//  Created by Henit Work on 10/08/21.
//

import UIKit

class ExamsViewController: UIViewController {

    @IBOutlet weak var examTableView: UITableView!
    @IBOutlet weak var uploadPaperButton: UIButton!
    
    struct Exam {
        var ExamTitle : String
        var ExamSubtitle : String
    }
    
    let exams : [Exam] = [Exam(ExamTitle: "CAT 1", ExamSubtitle: "Continuous Assessment Test 1"), Exam(ExamTitle: "CAT 2", ExamSubtitle: "Continuous Assessment Test 2"),Exam(ExamTitle: "FAT", ExamSubtitle: "Final Assessment Test")]
    
    override func viewWillAppear(_ animated: Bool) {
        uploadPaperButton.layer.cornerRadius = 10
        uploadPaperButton.layer.borderWidth = 2
        uploadPaperButton.layer.borderColor = #colorLiteral(red: 0.453212142, green: 0.3028472662, blue: 0.9352923036, alpha: 1)
        examTableView.register(UINib(nibName: "ExamSelectionTableViewCell", bundle: nil), forCellReuseIdentifier: "examTile")
        examTableView.rowHeight = 98
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        examTableView.dataSource = self
        examTableView.delegate = self
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapUploadPaper(_ sender: Any) {
        
    }
    
}

extension ExamsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = examTableView.dequeueReusableCell(withIdentifier: "examTile", for: indexPath) as! ExamSelectionTableViewCell
        cell.examTitle.text = exams[indexPath.row].ExamTitle
        cell.examSubTitle.text = exams[indexPath.row].ExamSubtitle
        let myCustomSelectionColorView = UIView()
        myCustomSelectionColorView.backgroundColor = #colorLiteral(red: 0.453212142, green: 0.3028472662, blue: 0.9352923036, alpha: 0.6403532723)
        myCustomSelectionColorView.layer.cornerRadius = 10
        cell.selectedBackgroundView = myCustomSelectionColorView
        return cell
    }
    
}

extension ExamsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toSubjectsPage", sender: self)
    }
    
}
