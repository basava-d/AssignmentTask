//
//  ProductLife.swift
//
//  Created by Basavaraj on 05/08/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class ProductLife: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let isMinimum = "is_minimum"
    static let time = "time"
    static let metric = "metric"
  }

  // MARK: Properties
  public var isMinimum: Bool? = false
  public var time: Int?
  public var metric: String?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public required init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public func mapping(map: Map) {
    isMinimum <- map[SerializationKeys.isMinimum]
    time <- map[SerializationKeys.time]
    metric <- map[SerializationKeys.metric]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.isMinimum] = isMinimum
    if let value = time { dictionary[SerializationKeys.time] = value }
    if let value = metric { dictionary[SerializationKeys.metric] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.isMinimum = aDecoder.decodeBool(forKey: SerializationKeys.isMinimum)
    self.time = aDecoder.decodeObject(forKey: SerializationKeys.time) as? Int
    self.metric = aDecoder.decodeObject(forKey: SerializationKeys.metric) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(isMinimum, forKey: SerializationKeys.isMinimum)
    aCoder.encode(time, forKey: SerializationKeys.time)
    aCoder.encode(metric, forKey: SerializationKeys.metric)
  }

}
