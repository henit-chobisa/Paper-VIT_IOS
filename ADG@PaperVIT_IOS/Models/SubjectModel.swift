

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
    let examType:Int
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
    
    func getAllSubject(){
        let url = URL(string: "https://adg-papervit.herokuapp.com/api/v1/subjects/0?skip=0&limit=5'")
        URLSession.shared.dataTask(with: url!){(data, response, error) in
            guard let data = data, error == nil, response != nil else {
                
                print(error!.localizedDescription)
                return
            }
            do {
                let decoder = JSONDecoder()
                print(String(data: data, encoding: .utf8)!)
                let response = try decoder.decode(SubjectModel.self, from: data)
                
            }
            catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}




