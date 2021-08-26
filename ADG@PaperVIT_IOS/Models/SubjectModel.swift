//
//  File.swift
//  ADG@PaperVIT_IOS
//
//  Created by Samridh Agarwal on 27/08/21.
//

import Foundation

struct SubjectModel:Codable{
    let data:subjectData
    let metaData:metaData
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




