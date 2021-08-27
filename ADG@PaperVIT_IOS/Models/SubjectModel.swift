

import Foundation

struct SubjectModel:Codable{
    let data:subjectData?
    let metaData:metaData?
}
struct subjectDetail:Codable{
    let _id:String
    let shortName:String
    let subjectName:String
    let subjectCode:String
    let createdAt:String
    let updatedAt:String
}

struct subjectData:Codable{
    let subjects:[subjectDetail]
}

struct metaData : Codable {
    let success : Bool
    let status : Int
    let timestamp : String
}

class Subject {
    
    let group = DispatchGroup()
    
    private func getAllSubject(){
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
            self.group.leave()
        }.resume()
        
        group.notify(queue: .main){
            allSubjects = self.parseJSON(data: alldata!)
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
}




