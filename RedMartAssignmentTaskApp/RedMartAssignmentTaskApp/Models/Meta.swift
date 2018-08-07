//
//  Meta.swift
//
//  Created by Basavaraj D on 04/08/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Meta: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let desc = "desc"
    static let title = "title"
    static let keywords = "keywords"
  }

  // MARK: Properties
  public var desc: String?
  public var title: String?
  public var keywords: String?

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
    desc <- map[SerializationKeys.desc]
    title <- map[SerializationKeys.title]
    keywords <- map[SerializationKeys.keywords]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = desc { dictionary[SerializationKeys.desc] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = keywords { dictionary[SerializationKeys.keywords] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.desc = aDecoder.decodeObject(forKey: SerializationKeys.desc) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.keywords = aDecoder.decodeObject(forKey: SerializationKeys.keywords) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(desc, forKey: SerializationKeys.desc)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(keywords, forKey: SerializationKeys.keywords)
  }

}
