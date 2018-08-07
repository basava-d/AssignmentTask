//
//  Filters.swift
//
//  Created by Basavaraj on 05/08/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Filters: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let mfrName = "mfr_name"
    static let vendorName = "vendor_name"
    static let brandUri = "brand_uri"
    static let brandName = "brand_name"
    static let countryOfOrigin = "country_of_origin"
    static let trendingFrequency = "trending_frequency"
    static let frequency = "frequency"
    static let isOrganic = "is_organic"
  }

  // MARK: Properties
  public var mfrName: String?
  public var vendorName: String?
  public var brandUri: String?
  public var brandName: String?
  public var countryOfOrigin: String?
  public var trendingFrequency: Int?
  public var frequency: Int?
  public var isOrganic: Int?

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
    mfrName <- map[SerializationKeys.mfrName]
    vendorName <- map[SerializationKeys.vendorName]
    brandUri <- map[SerializationKeys.brandUri]
    brandName <- map[SerializationKeys.brandName]
    countryOfOrigin <- map[SerializationKeys.countryOfOrigin]
    trendingFrequency <- map[SerializationKeys.trendingFrequency]
    frequency <- map[SerializationKeys.frequency]
    isOrganic <- map[SerializationKeys.isOrganic]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = mfrName { dictionary[SerializationKeys.mfrName] = value }
    if let value = vendorName { dictionary[SerializationKeys.vendorName] = value }
    if let value = brandUri { dictionary[SerializationKeys.brandUri] = value }
    if let value = brandName { dictionary[SerializationKeys.brandName] = value }
    if let value = countryOfOrigin { dictionary[SerializationKeys.countryOfOrigin] = value }
    if let value = trendingFrequency { dictionary[SerializationKeys.trendingFrequency] = value }
    if let value = frequency { dictionary[SerializationKeys.frequency] = value }
    if let value = isOrganic { dictionary[SerializationKeys.isOrganic] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.mfrName = aDecoder.decodeObject(forKey: SerializationKeys.mfrName) as? String
    self.vendorName = aDecoder.decodeObject(forKey: SerializationKeys.vendorName) as? String
    self.brandUri = aDecoder.decodeObject(forKey: SerializationKeys.brandUri) as? String
    self.brandName = aDecoder.decodeObject(forKey: SerializationKeys.brandName) as? String
    self.countryOfOrigin = aDecoder.decodeObject(forKey: SerializationKeys.countryOfOrigin) as? String
    self.trendingFrequency = aDecoder.decodeObject(forKey: SerializationKeys.trendingFrequency) as? Int
    self.frequency = aDecoder.decodeObject(forKey: SerializationKeys.frequency) as? Int
    self.isOrganic = aDecoder.decodeObject(forKey: SerializationKeys.isOrganic) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(mfrName, forKey: SerializationKeys.mfrName)
    aCoder.encode(vendorName, forKey: SerializationKeys.vendorName)
    aCoder.encode(brandUri, forKey: SerializationKeys.brandUri)
    aCoder.encode(brandName, forKey: SerializationKeys.brandName)
    aCoder.encode(countryOfOrigin, forKey: SerializationKeys.countryOfOrigin)
    aCoder.encode(trendingFrequency, forKey: SerializationKeys.trendingFrequency)
    aCoder.encode(frequency, forKey: SerializationKeys.frequency)
    aCoder.encode(isOrganic, forKey: SerializationKeys.isOrganic)
  }

}
