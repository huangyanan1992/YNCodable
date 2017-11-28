//
//  ViewController.swift
//  YNCodable
//
//  Created by Huang Yanan on 2017/11/27.
//  Copyright © 2017年 Huang Yanan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let responseRes = """
                      {
                        "test": {
                          "res": {
                              "list": [
                                  {
                                    "title": "title1 ",
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
    let response = """
                        {
                          "list": [
                              {
                                "title": "title1 ",
                                "series": "series"
                              },
                              {
                                "title": "title2"
                              }
                          ]
                        }
                   """
    let responseArray = """
                            [
                                {
                                    "name": "Home Town Market I",
                                    "aisles": [
                                        {
                                            "name": "Produce",
                                            "shelves": [
                                                {
                                                    "name": "Discount Produce",
                                                    "product": {
                                                        "name": "Banana",
                                                        "points": 200,
                                                        "description": "A banana that's perfectly ripe."
                                                    }
                                                }
                                            ]
                                        }
                                    ]
                                },
                                {
                                    "name": "Home Town Market II",
                                    "aisles": [
                                        {
                                            "name": "Produce",
                                            "shelves": [
                                                {
                                                    "name": "Discount Produce",
                                                    "product": {
                                                        "name": "Banana",
                                                        "points": 200,
                                                        "description": "A banana that's perfectly ripe."
                                                    }
                                                }
                                            ]
                                        }
                                    ]
                                }
                            ]
                        """
    guard let responseListFromKeypath = dump(ResponseList.decode(from: responseRes, keyPath: "test.res")) else {
      return
    }
    print(responseListFromKeypath)
    guard responseListFromKeypath.list.count != 0 else {
      return
    }
    print(responseListFromKeypath.list[0].title)
    
    guard let listFromKeyPath = dump([List].decode(from: responseRes, keyPath: "test.res.list")) else {
      return
    }
    print(listFromKeyPath)
    guard listFromKeyPath.count != 0 else {
      return
    }
    print(listFromKeyPath[0].title)
    
    guard let responseList = dump(ResponseList.decode(from: response)) else {
      return
    }
    print(responseList)
    guard responseList.list.count != 0 else {
      return
    }
    print(responseList.list[0].title)
    
    guard let marketList = [MarketList].decode(from: responseArray) else {
      return
    }
    print(marketList)
  }
}

struct Product: Codable {
  var name = ""
  var points = 0
  var description = ""
}

struct Shelves: Codable {
  var name = ""
  var product = Product()
}

struct MarketList: Codable {
  var name = ""
  var aisles = [Aisles]()
}

struct Aisles: Codable {
  var name = ""
  var shelves = [Shelves]()
}


struct ResponseList: Codable {
  var list = [List]()
}

struct List: Codable {
  var title = ""
  var series: String?
}


