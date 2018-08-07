//
//  Warehouse.swift
//
//  Created by Basavaraj on 05/08/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Warehouse: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let measure = "measure"
  }

  // MARK: Properties
  public var measure: Measure?

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
    measure <- map[SerializationKeys.measure]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = measure { dictionary[SerializationKeys.measure] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.measure = aDecoder.decodeObject(forKey: SerializationKeys.measure) as? Measure
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(measure, forKey: SerializationKeys.measure)
  }

}
