//
//  YNCodable.swift
//  YNCodable
//
//  Created by Huang Yanan on 2017/11/27.
//  Copyright © 2017年 Huang Yanan. All rights reserved.
//

import Foundation

let hyn_decoder = JSONDecoder()
let hyn_encoder = JSONEncoder()

extension Decodable {
  
  public static func decode(from string: String, keyPath: String? = nil) -> Self? {
    guard let data = string.data(using: .utf8) else {
      debugPrint("data is nil")
      return nil
    }
    if let keyPath = keyPath, !keyPath.isEmpty {
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
        debugPrint(error)
      }
    }
    else {
      return decode(from: data)
    }
    return nil
  }
  
  public static func decode(from data: Data) -> Self? {
    let result = hyn_decoder.hyn_decode(self, from: data)
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
    return hyn_encoder.hyn_encode(self)
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
