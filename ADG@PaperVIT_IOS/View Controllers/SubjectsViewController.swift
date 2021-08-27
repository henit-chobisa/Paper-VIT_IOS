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
    
    var Subjects : [subjectDetail] = []
    
    override func viewWillAppear(_ animated: Bool) {
        subjectTableView.register(UINib(nibName: "SubjectsTableViewCell", bundle: nil), forCellReuseIdentifier: "subjectCell")
        subjectTableView.dataSource = self
        subjectTableView.delegate = self
        subjectTableView.rowHeight = 100
        getAllSubject()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    private func getAllSubject(){
        let group = DispatchGroup()
        let url = URL(string: "https://adg-papervit.herokuapp.com/api/v1/subjects/0?skip=0&limit=5'")
        var allSubjects : SubjectModel? = nil
        var alldata : Data? = nil
        group.enter()
        URLSession.shared.dataTask(with: url!){(data, response, error) in
            guard let data = data, error == nil, response != nil else {
                print(error!.localizedDescription)
                return
            }
            alldata = data
            group.leave()
        }.resume()
        
        group.notify(queue: .main){
            allSubjects = self.parseJSON(data: alldata!)
            self.Subjects = (allSubjects?.data!.subjects)!
            self.subjectTableView.reloadData()
        }
    }
    func parseJSON(data : Data) -> SubjectModel?{
        let decoder = JSONDecoder()
        do {
            print(String(data: data, encoding: .utf8)!)
            let response = try decoder.decode(SubjectModel.self, from: data)
            
            return response
        }
        catch{
            print(error)
            return nil
        }
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
        cell.courseShortLabel.text = Subjects[indexPath.row].shortName
        cell.courseLongLabel.text =  Subjects[indexPath.row].subjectName
        cell.courseCode.text =  Subjects[indexPath.row].subjectCode
        
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

