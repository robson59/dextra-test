//
//  Fast_NewsTests.swift
//  Fast NewsTests
//
//  Created by Lucas Moreton on 16/09/19.
//  Copyright © 2019 Lucas Moreton. All rights reserved.
//

import XCTest
@testable import Fast_News

class Fast_NewsTests: XCTestCase {

    func testFetchNews()
    {
        let e = expectation(description: "Alamofire")
        
        HotNewsProvider.shared.hotNews { (completion) in
            do {
                let hotNews = try completion()
                XCTAssertNotNil(hotNews, "hotNews is nil")
                XCTAssertEqual(hotNews.count > 0, true, "hotNews is empty")
            } catch {
                XCTFail()
            }
            e.fulfill()
        }
        waitForExpectations(timeout: 15.0, handler: nil)
    }
    
    
    func testFetchComments()
    {
        let e = expectation(description: "Alamofire")
        
        
        HotNewsProvider.shared.hotNewsComments(id: "j4w0o3") { (completion) in
            do {
                let comments = try completion()
                XCTAssertNotNil(comments, "comments is nil")
                XCTAssertEqual(comments.count > 0, true, "comments is empty")
            
            } catch {
                XCTFail()
            }
            e.fulfill()
        }
        waitForExpectations(timeout: 15.0, handler: nil)
    }
    
    
}
