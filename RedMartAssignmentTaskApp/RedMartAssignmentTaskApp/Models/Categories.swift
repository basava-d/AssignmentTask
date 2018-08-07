//
//  Categories.swift
//
//  Created by Basavaraj D on 04/08/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Categories: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let id = "id"
    static let uri = "uri"
    static let image = "image"
    static let count = "count"
  }

  // MARK: Properties
  public var name: String?
  public var id: Int?
  public var uri: String?
  public var image: String?
  public var count: Int?

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
    name <- map[SerializationKeys.name]
    id <- map[SerializationKeys.id]
    uri <- map[SerializationKeys.uri]
    image <- map[SerializationKeys.image]
    count <- map[SerializationKeys.count]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = uri { dictionary[SerializationKeys.uri] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = count { dictionary[SerializationKeys.count] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.uri = aDecoder.decodeObject(forKey: SerializationKeys.uri) as? String
    self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
    self.count = aDecoder.decodeObject(forKey: SerializationKeys.count) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(uri, forKey: SerializationKeys.uri)
    aCoder.encode(image, forKey: SerializationKeys.image)
    aCoder.encode(count, forKey: SerializationKeys.count)
  }

}
