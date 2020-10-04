//
//  News.swift
//  Fast News
//
//  Copyright © 2019 Lucas Moreton. All rights reserved.
//

import Foundation

struct HotNews: Codable {
    var authorFullname: String?
    var created: Int?
    var downs: Int?
    var numComments: Int?
    var preview: Preview?
    var score: Int?
    var title: String?
    var ups: Int?
    var url: String?
    var id: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, title, preview, url, created, ups, downs, score
        case authorFullname = "author_fullname"
        case numComments = "num_comments"
    }
}
