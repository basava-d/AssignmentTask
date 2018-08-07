//
//  AtpLots.swift
//
//  Created by Basavaraj on 05/08/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class AtpLots: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let toDate = "to_date"
    static let stockStatus = "stock_status"
    static let qtyInStock = "qty_in_stock"
    static let qtyInCarts = "qty_in_carts"
    static let fromDate = "from_date"
  }

  // MARK: Properties
  public var toDate: String?
  public var stockStatus: Int?
  public var qtyInStock: Int?
  public var qtyInCarts: Int?
  public var fromDate: String?

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
    toDate <- map[SerializationKeys.toDate]
    stockStatus <- map[SerializationKeys.stockStatus]
    qtyInStock <- map[SerializationKeys.qtyInStock]
    qtyInCarts <- map[SerializationKeys.qtyInCarts]
    fromDate <- map[SerializationKeys.fromDate]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = toDate { dictionary[SerializationKeys.toDate] = value }
    if let value = stockStatus { dictionary[SerializationKeys.stockStatus] = value }
    if let value = qtyInStock { dictionary[SerializationKeys.qtyInStock] = value }
    if let value = qtyInCarts { dictionary[SerializationKeys.qtyInCarts] = value }
    if let value = fromDate { dictionary[SerializationKeys.fromDate] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.toDate = aDecoder.decodeObject(forKey: SerializationKeys.toDate) as? String
    self.stockStatus = aDecoder.decodeObject(forKey: SerializationKeys.stockStatus) as? Int
    self.qtyInStock = aDecoder.decodeObject(forKey: SerializationKeys.qtyInStock) as? Int
    self.qtyInCarts = aDecoder.decodeObject(forKey: SerializationKeys.qtyInCarts) as? Int
    self.fromDate = aDecoder.decodeObject(forKey: SerializationKeys.fromDate) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(toDate, forKey: SerializationKeys.toDate)
    aCoder.encode(stockStatus, forKey: SerializationKeys.stockStatus)
    aCoder.encode(qtyInStock, forKey: SerializationKeys.qtyInStock)
    aCoder.encode(qtyInCarts, forKey: SerializationKeys.qtyInCarts)
    aCoder.encode(fromDate, forKey: SerializationKeys.fromDate)
  }

}
