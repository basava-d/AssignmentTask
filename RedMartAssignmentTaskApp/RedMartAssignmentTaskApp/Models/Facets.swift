//
//  Facets.swift
//
//  Created by Basavaraj D on 04/08/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Facets: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let categories = "categories"
  }

  // MARK: Properties
  public var categories: [Categories]?

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
    categories <- map[SerializationKeys.categories]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = categories { dictionary[SerializationKeys.categories] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.categories = aDecoder.decodeObject(forKey: SerializationKeys.categories) as? [Categories]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(categories, forKey: SerializationKeys.categories)
  }

}
