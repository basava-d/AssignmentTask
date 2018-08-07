//
//  DescriptionFields.swift
//
//  Created by Basavaraj D on 04/08/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class DescriptionFields: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let secondary = "secondary"
    static let primary = "primary"
  }

  // MARK: Properties
  public var secondary: [Any]?
  public var primary: [Primary]?

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
    secondary <- map[SerializationKeys.secondary]
    primary <- map[SerializationKeys.primary]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = secondary { dictionary[SerializationKeys.secondary] = value }
    if let value = primary { dictionary[SerializationKeys.primary] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.secondary = aDecoder.decodeObject(forKey: SerializationKeys.secondary) as? [Any]
    self.primary = aDecoder.decodeObject(forKey: SerializationKeys.primary) as? [Primary]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(secondary, forKey: SerializationKeys.secondary)
    aCoder.encode(primary, forKey: SerializationKeys.primary)
  }

}
