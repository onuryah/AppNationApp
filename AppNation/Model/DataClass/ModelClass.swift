//
//  ModelClass.swift
//  AppNation
//
//  Created by Onuralp Yahnici on 3.02.2022.
//

import Foundation


struct JSON: Decodable, Encodable {
    let data: JSONData
}

struct JSONData: Codable {
    let children: [Child]
}

struct Child: Codable {
    let data: ChildData
}

struct ChildData: Codable {
    let title: String
    let score: Int
    let thumbnail: String
    let author: String
    let selftext: String
}
















