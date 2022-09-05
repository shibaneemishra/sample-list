//
//  ApiTestFile.swift
//  Test123Tests
//
//  Created by Shibanee Mishra on 06/09/22.
//

import XCTest
@testable import Test123

class TestAPITests: XCTestCase {

    func test_api_withValidRequest_returnScucess(){
        
        let repo = ListRepository()
        let expection = self.expectation(description: "ScucessResponse")
         repo.fetchList{ response in
            
            XCTAssertNotNil(response)
            
            expection.fulfill()
        } _:{ error in
            
        }
       
        waitForExpectations(timeout: 10, handler: nil)
        
    }
    
    func test_api_withValidResponse(){
        
        let repo = ListRepository()
        let expection = self.expectation(description: "ValidResponse")
         repo.fetchList{ response in
                                       
             XCTAssertTrue(response?.count ?? 0 > 0)
             
             XCTAssertTrue(((response?.map{$0.userId == 1}) != nil))
            
            
            expection.fulfill()
        } _:{ error in
            
        }
       
        waitForExpectations(timeout: 10, handler: nil)
        
    }
    
    func test_api_withValidUserId(){
        
        let repo = ListRepository()
        let expection = self.expectation(description: "ValidUserId")
         repo.fetchList{ response in
                                                    
             XCTAssertTrue(((response?.map{$0.userId == 1}) != nil))
            
            
            expection.fulfill()
        } _:{ error in
            
        }
       
        waitForExpectations(timeout: 10, handler: nil)
        
    }
    
    func test_api_withValidListId(){
        
        let repo = ListRepository()
        let expection = self.expectation(description: "ValidListId")
         repo.fetchList{ response in
                                                                 
             XCTAssertNotNil(response?.map{$0.id})
            
            
            expection.fulfill()
        } _:{ error in
            
        }
       
        waitForExpectations(timeout: 10, handler: nil)
        
    }

}
