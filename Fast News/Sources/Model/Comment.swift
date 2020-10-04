//
//  Comment.swift
//  Fast News
//
//  Copyright © 2019 Lucas Moreton. All rights reserved.
//

import Foundation

struct Comment: Codable {
    var authorFullname: String?
    var body: String?
    var created: Int?
    var downs: Int?
    var ups: Int?
    
    private enum CodingKeys: String, CodingKey {
        case created, ups, downs, body
        case authorFullname = "author_fullname"
    }
    
    //MARK: - Public Methods
    func isEmpty() -> Bool {
        guard let _ = created, let _ = ups, let _ = downs, let _ = body, let _ = authorFullname else {
            return true
        }
        
        return false
    }
}
