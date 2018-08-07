//
//  LiveUp.swift
//
//  Created by Basavaraj D on 04/08/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class LiveUp: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let savingsAmount = "savings_amount"
    static let promoPrice = "promo_price"
    static let savingsType = "savings_type"
    static let savingsText = "savings_text"
    static let savings = "savings"
  }

  // MARK: Properties
  public var savingsAmount: Float?
  public var promoPrice: Float?
  public var savingsType: Int?
  public var savingsText: String?
  public var savings: Int?

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
    savingsAmount <- map[SerializationKeys.savingsAmount]
    promoPrice <- map[SerializationKeys.promoPrice]
    savingsType <- map[SerializationKeys.savingsType]
    savingsText <- map[SerializationKeys.savingsText]
    savings <- map[SerializationKeys.savings]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = savingsAmount { dictionary[SerializationKeys.savingsAmount] = value }
    if let value = promoPrice { dictionary[SerializationKeys.promoPrice] = value }
    if let value = savingsType { dictionary[SerializationKeys.savingsType] = value }
    if let value = savingsText { dictionary[SerializationKeys.savingsText] = value }
    if let value = savings { dictionary[SerializationKeys.savings] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.savingsAmount = aDecoder.decodeObject(forKey: SerializationKeys.savingsAmount) as? Float
    self.promoPrice = aDecoder.decodeObject(forKey: SerializationKeys.promoPrice) as? Float
    self.savingsType = aDecoder.decodeObject(forKey: SerializationKeys.savingsType) as? Int
    self.savingsText = aDecoder.decodeObject(forKey: SerializationKeys.savingsText) as? String
    self.savings = aDecoder.decodeObject(forKey: SerializationKeys.savings) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(savingsAmount, forKey: SerializationKeys.savingsAmount)
    aCoder.encode(promoPrice, forKey: SerializationKeys.promoPrice)
    aCoder.encode(savingsType, forKey: SerializationKeys.savingsType)
    aCoder.encode(savingsText, forKey: SerializationKeys.savingsText)
    aCoder.encode(savings, forKey: SerializationKeys.savings)
  }

}
