//
//  Images.swift
//
//  Created by Basavaraj on 05/08/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Images: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let position = "position"
    static let name = "name"
    static let w = "w"
    static let h = "h"
  }

  // MARK: Properties
  public var position: Int?
  public var name: String?
  public var w: Int?
  public var h: Int?

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
    position <- map[SerializationKeys.position]
    name <- map[SerializationKeys.name]
    w <- map[SerializationKeys.w]
    h <- map[SerializationKeys.h]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = position { dictionary[SerializationKeys.position] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = w { dictionary[SerializationKeys.w] = value }
    if let value = h { dictionary[SerializationKeys.h] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.position = aDecoder.decodeObject(forKey: SerializationKeys.position) as? Int
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.w = aDecoder.decodeObject(forKey: SerializationKeys.w) as? Int
    self.h = aDecoder.decodeObject(forKey: SerializationKeys.h) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(position, forKey: SerializationKeys.position)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(w, forKey: SerializationKeys.w)
    aCoder.encode(h, forKey: SerializationKeys.h)
  }

}
