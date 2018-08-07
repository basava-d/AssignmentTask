//
//  Merchant.swift
//
//  Created by Basavaraj D on 04/08/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Merchant: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let subVendorId = "sub_vendor_id"
    static let subVendorName = "sub_vendor_name"
    static let subVendorLogo = "sub_vendor_logo"
  }

  // MARK: Properties
  public var subVendorId: Int?
  public var subVendorName: String?
  public var subVendorLogo: SubVendorLogo?

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
    subVendorId <- map[SerializationKeys.subVendorId]
    subVendorName <- map[SerializationKeys.subVendorName]
    subVendorLogo <- map[SerializationKeys.subVendorLogo]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = subVendorId { dictionary[SerializationKeys.subVendorId] = value }
    if let value = subVendorName { dictionary[SerializationKeys.subVendorName] = value }
    if let value = subVendorLogo { dictionary[SerializationKeys.subVendorLogo] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.subVendorId = aDecoder.decodeObject(forKey: SerializationKeys.subVendorId) as? Int
    self.subVendorName = aDecoder.decodeObject(forKey: SerializationKeys.subVendorName) as? String
    self.subVendorLogo = aDecoder.decodeObject(forKey: SerializationKeys.subVendorLogo) as? SubVendorLogo
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(subVendorId, forKey: SerializationKeys.subVendorId)
    aCoder.encode(subVendorName, forKey: SerializationKeys.subVendorName)
    aCoder.encode(subVendorLogo, forKey: SerializationKeys.subVendorLogo)
  }

}
