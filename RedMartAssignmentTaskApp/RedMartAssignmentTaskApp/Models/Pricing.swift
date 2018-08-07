//
//  Pricing.swift
//
//  Created by Basavaraj on 05/08/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Pricing: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let promoPrice = "promo_price"
    static let savingsType = "savings_type"
    static let savingsText = "savings_text"
    static let savings = "savings"
    static let onSale = "on_sale"
    static let savingsAmount = "savings_amount"
    static let promoId = "promo_id"
    static let price = "price"
  }

  // MARK: Properties
  public var promoPrice: Float?
  public var savingsType: Int?
  public var savingsText: String?
  public var savings: Int?
  public var onSale: Int?
  public var savingsAmount: Float?
  public var promoId: Int?
  public var price: Float?

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
    promoPrice <- map[SerializationKeys.promoPrice]
    savingsType <- map[SerializationKeys.savingsType]
    savingsText <- map[SerializationKeys.savingsText]
    savings <- map[SerializationKeys.savings]
    onSale <- map[SerializationKeys.onSale]
    savingsAmount <- map[SerializationKeys.savingsAmount]
    promoId <- map[SerializationKeys.promoId]
    price <- map[SerializationKeys.price]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = promoPrice { dictionary[SerializationKeys.promoPrice] = value }
    if let value = savingsType { dictionary[SerializationKeys.savingsType] = value }
    if let value = savingsText { dictionary[SerializationKeys.savingsText] = value }
    if let value = savings { dictionary[SerializationKeys.savings] = value }
    if let value = onSale { dictionary[SerializationKeys.onSale] = value }
    if let value = savingsAmount { dictionary[SerializationKeys.savingsAmount] = value }
    if let value = promoId { dictionary[SerializationKeys.promoId] = value }
    if let value = price { dictionary[SerializationKeys.price] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.promoPrice = aDecoder.decodeObject(forKey: SerializationKeys.promoPrice) as? Float
    self.savingsType = aDecoder.decodeObject(forKey: SerializationKeys.savingsType) as? Int
    self.savingsText = aDecoder.decodeObject(forKey: SerializationKeys.savingsText) as? String
    self.savings = aDecoder.decodeObject(forKey: SerializationKeys.savings) as? Int
    self.onSale = aDecoder.decodeObject(forKey: SerializationKeys.onSale) as? Int
    self.savingsAmount = aDecoder.decodeObject(forKey: SerializationKeys.savingsAmount) as? Float
    self.promoId = aDecoder.decodeObject(forKey: SerializationKeys.promoId) as? Int
    self.price = aDecoder.decodeObject(forKey: SerializationKeys.price) as? Float
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(promoPrice, forKey: SerializationKeys.promoPrice)
    aCoder.encode(savingsType, forKey: SerializationKeys.savingsType)
    aCoder.encode(savingsText, forKey: SerializationKeys.savingsText)
    aCoder.encode(savings, forKey: SerializationKeys.savings)
    aCoder.encode(onSale, forKey: SerializationKeys.onSale)
    aCoder.encode(savingsAmount, forKey: SerializationKeys.savingsAmount)
    aCoder.encode(promoId, forKey: SerializationKeys.promoId)
    aCoder.encode(price, forKey: SerializationKeys.price)
  }

}
