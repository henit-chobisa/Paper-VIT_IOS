//
//  PaperModel.swift
//  ADG@PaperVIT_IOS
//
//  Created by Samridh Agarwal on 27/08/21.
//

import Foundation

struct PaperModel:Codable
{
    let data:[Data]
    
}
struct paperDetail:Codable {
    let _id:String
    let subjectId:String
    let semester:String
    let slot:String
    let url:String
    let fileName:String
}

struct Data:Codable{
    let paper:[paperDetail]
    let subject:[subjectDetail]
}


