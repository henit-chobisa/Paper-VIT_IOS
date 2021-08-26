//
//  PaperModel.swift
//  ADG@PaperVIT_IOS
//
//  Created by Samridh Agarwal on 27/08/21.
//

import Foundation

struct PaperModel:Codable
{
    let data:paperData
    let metaData:papermetaData
}
struct paperDetail:Codable {
    let _id:String
    let subjectId:String
    let semester:String
    let slot:String
    let url:String
    let fileName:String
    let createdAt:String
    let updatedAt:String
}

struct paperData:Codable{
    let paper:[paperDetail]
    let subject:subjectDetail
}
struct papermetaData:Codable{
    let success:Bool
    let status:Int
    let timestamp:String
}


class Paper {

    func getAllPapers(){
        let url = URL(string: "https://adg-papervit.herokuapp.com/api/v1/public/paper")!
        let task = URLSession.shared.dataTask(with: url){(data, response, error) in
            guard let data = data, error == nil, response != nil else {
                print("error : Maybe data or error or response")
                return
            }
            do {
                
                let decoder = JSONDecoder()
                let papers : PaperModel = try decoder.decode(PaperModel.self, from: data)
                print(papers.data.paper.count)
            }
            catch {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
}



