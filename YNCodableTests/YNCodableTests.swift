//
//  YNCodableTests.swift
//  YNCodableTests
//
//  Created by Huang Yanan on 2017/11/27.
//  Copyright © 2017年 Huang Yanan. All rights reserved.
//

import XCTest
@testable import YNCodable

class YNCodableTests: XCTestCase {
    
  override func setUp() {
    super.setUp()
  }
    
  func testDecode() {
    let responseRes = """
                    {
                      "test": {
                        "res": {
                            "list": [
                                {
                                  "title": "title1",
                                  "series": "series"
                                },
                                {
                                  "title": "title2"
                                }
                            ]
                          }
                        }
                      }
                 """
    let responseList = ResponseList.decode(from: responseRes, keyPath: "test.res")
    XCTAssertNotNil(responseList)
    guard let list = responseList?.list else {
      return
    }
    XCTAssertTrue(list.count == 2)
    XCTAssertTrue(list[0].title == "title1")
    XCTAssertNil(list[1].series)
  }
  
  func testEncode() {
    let jsonString = """
{"list":[{"title":"title0","series":"series0"},{"title":"title1","series":"series1"},{"title":"title2","series":"series2"}]}
"""
    var responseList = ResponseList.init(list: [List]())
    for i in 0...2 {
      let list = List.init(title: "title\(i)", series: "series\(i)")
      responseList.list.append(list)
    }
    let encodeString = responseList.encode()
    XCTAssertTrue(jsonString == encodeString)
  }
    
  func testEncodeMeasure() {
      // This is an example of a performance test case.
    var responseList = ResponseList.init(list: [List]())
    for i in 0...10000 {
      let list = List.init(title: "title\(i)", series: "series\(i)")
      responseList.list.append(list)
    }
    print(responseList.encode())
    self.measure {
      _ = responseList.encode()
    }
  }
  func testDecodeMeasure() {
    var jsonString = """
{"list":[
"""
    for i in 0...9999 {
      if i != 9999 {
        jsonString.append("""
          {"title":"title\(i)","series":"series\(i)"},
          """
        )
      } else {
        jsonString.append("""
          {"title":"title\(i)","series":"series\(i)"}]}
          """
        )
      }
    }
    self.measure {
      _ = ResponseList.decode(from: jsonString)
    }
  }
}
