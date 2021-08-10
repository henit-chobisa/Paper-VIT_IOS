//
//  SubjectsViewController.swift
//  ADG@PaperVIT_IOS
//
//  Created by Henit Work on 10/08/21.
//

import UIKit

class SubjectsViewController: UIViewController {

    @IBOutlet weak var subjectTableView: UITableView!
    @IBOutlet weak var subjectSearch: UISearchBar!
    
    let SectionTitles = ["Favourites", "All Subjects"]
    
    struct subject {
        var courseShortLabel : String
        var courseLongLabel : String
        var courseCode : String
    }
    
    var Subjects : [subject] = [subject(courseShortLabel: "DV", courseLongLabel: "Data Visualization", courseCode: "CSE3011"), subject(courseShortLabel: "DV", courseLongLabel: "Data Visualization", courseCode: "CSE3011"), subject(courseShortLabel: "DV", courseLongLabel: "Data Visualization", courseCode: "CSE3011")]
    
    override func viewWillAppear(_ animated: Bool) {
        subjectTableView.register(UINib(nibName: "SubjectsTableViewCell", bundle: nil), forCellReuseIdentifier: "subjectCell")
        subjectTableView.dataSource = self
        subjectTableView.delegate = self
        subjectTableView.rowHeight = 100
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toExpandedSubjects"){
            if let VC = segue.destination as? SubjectExpandedViewController {
                if let sender = sender as? subject{
                    VC.SubjectTitle = sender.courseShortLabel
                }
            }
        }
    }

    
}

extension SubjectsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = subjectTableView.dequeueReusableCell(withIdentifier: "subjectCell", for: indexPath) as! SubjectsTableViewCell
        cell.courseShortLabel.text = Subjects[indexPath.row].courseShortLabel
        cell.courseLongLabel.text =  Subjects[indexPath.row].courseLongLabel
        cell.courseCode.text =  Subjects[indexPath.row].courseCode
        
        return cell
    }
}

extension SubjectsViewController : UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SectionTitles[section]
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toExpandedSubjects", sender: Subjects[indexPath.row])
    }
    
}

