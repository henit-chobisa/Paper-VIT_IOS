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
    let metaData:metaData
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
struct metaData:Codable{
    let success:Bool
    let status:Int
    let timestamp:String
}



