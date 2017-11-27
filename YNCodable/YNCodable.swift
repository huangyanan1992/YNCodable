//
//  YNCodable.swift
//  YNCodable
//
//  Created by Huang Yanan on 2017/11/27.
//  Copyright © 2017年 Huang Yanan. All rights reserved.
//

import Foundation

extension Decodable {
  
  public static func decode(from string: String, keyPath: String) -> Self? {
    guard let data = string.data(using: .utf8) else {
      return nil
    }
    do {
      let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
      let object = (json as AnyObject).value(forKeyPath: keyPath)
      do {
        let objectForKeypath = try JSONSerialization.data(withJSONObject: object ?? "", options: .prettyPrinted)
        return decode(from: objectForKeypath)
      } catch let error as NSError {
        debugPrint(error)
      }
    } catch let error as NSError {
      print(error)
    }
    
    return decode(from: data)
  }
  
  public static func decode(from string: String) -> Self? {
    let data = string.data(using: .utf8)
    return decode(from: data)
  }
  
  public static func decode(from data: Data?) -> Self? {
    guard let data = data else {
      debugPrint("data is nil")
      return nil
    }
    let decoder = JSONDecoder()
    let result = dump(decoder.hyn_decode(self, from: data))
    return result
  }
  
}

extension JSONDecoder {
  
  public func hyn_decode<T>(_ type: T.Type, from data: Data) -> T? where T : Decodable {
    do {
      return try self.decode(type, from: data)
    } catch let error as NSError {
      debugPrint(error)
    }
    return nil
  }
}

extension Encodable {
  public func encode() -> String {
    let encoder = JSONEncoder()
    return encoder.hyn_encode(self)
  }
}

extension JSONEncoder {
  
  public func hyn_encode<T>(_ value: T) -> String where T : Encodable {
    return String(data: hyn_encode(value), encoding: .utf8) ?? ""
  }
  
  public func hyn_encode<T>(_ value: T) -> Data where T : Encodable {
    do {
      return try self.encode(value)
    } catch let error as NSError {
      debugPrint(error)
    }
    return Data()
  }
}
