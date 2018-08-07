//
//  Details.swift
//
//  Created by Basavaraj on 05/08/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Details: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let storageClass = "storage_class"
    static let status = "status"
    static let prodType = "prod_type"
    static let isNew = "is_new"
    static let uri = "uri"
  }

  // MARK: Properties
  public var storageClass: String?
  public var status: Int?
  public var prodType: Int?
  public var isNew: Int?
  public var uri: String?

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
    storageClass <- map[SerializationKeys.storageClass]
    status <- map[SerializationKeys.status]
    prodType <- map[SerializationKeys.prodType]
    isNew <- map[SerializationKeys.isNew]
    uri <- map[SerializationKeys.uri]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = storageClass { dictionary[SerializationKeys.storageClass] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = prodType { dictionary[SerializationKeys.prodType] = value }
    if let value = isNew { dictionary[SerializationKeys.isNew] = value }
    if let value = uri { dictionary[SerializationKeys.uri] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.storageClass = aDecoder.decodeObject(forKey: SerializationKeys.storageClass) as? String
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
    self.prodType = aDecoder.decodeObject(forKey: SerializationKeys.prodType) as? Int
    self.isNew = aDecoder.decodeObject(forKey: SerializationKeys.isNew) as? Int
    self.uri = aDecoder.decodeObject(forKey: SerializationKeys.uri) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(storageClass, forKey: SerializationKeys.storageClass)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(prodType, forKey: SerializationKeys.prodType)
    aCoder.encode(isNew, forKey: SerializationKeys.isNew)
    aCoder.encode(uri, forKey: SerializationKeys.uri)
  }

}
