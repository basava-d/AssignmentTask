//
//  Discounts.swift
//
//  Created by Basavaraj D on 04/08/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Discounts: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let promo = "promo"
  }

  // MARK: Properties
  public var promo: Promo?

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
    promo <- map[SerializationKeys.promo]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = promo { dictionary[SerializationKeys.promo] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.promo = aDecoder.decodeObject(forKey: SerializationKeys.promo) as? Promo
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(promo, forKey: SerializationKeys.promo)
  }

}
