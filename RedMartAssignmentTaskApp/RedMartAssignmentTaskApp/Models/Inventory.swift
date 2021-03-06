//
//  Inventory.swift
//
//  Created by Basavaraj on 05/08/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Inventory: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let stockStatus = "stock_status"
    static let qtyInCarts = "qty_in_carts"
    static let qtyInStock = "qty_in_stock"
    static let maxSaleQty = "max_sale_qty"
    static let limitedStockStatus = "limited_stock_status"
    static let nextAvailableDate = "next_available_date"
    static let atpLots = "atp_lots"
    static let stockType = "stock_type"
    static let originalMaxSaleQty = "original_max_sale_qty"
  }

  // MARK: Properties
  public var stockStatus: Int?
  public var qtyInCarts: Int?
  public var qtyInStock: Int?
  public var maxSaleQty: Int?
  public var limitedStockStatus: Int?
  public var nextAvailableDate: String?
  public var atpLots: [AtpLots]?
  public var stockType: Int?
  public var originalMaxSaleQty: Int?

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
    stockStatus <- map[SerializationKeys.stockStatus]
    qtyInCarts <- map[SerializationKeys.qtyInCarts]
    qtyInStock <- map[SerializationKeys.qtyInStock]
    maxSaleQty <- map[SerializationKeys.maxSaleQty]
    limitedStockStatus <- map[SerializationKeys.limitedStockStatus]
    nextAvailableDate <- map[SerializationKeys.nextAvailableDate]
    atpLots <- map[SerializationKeys.atpLots]
    stockType <- map[SerializationKeys.stockType]
    originalMaxSaleQty <- map[SerializationKeys.originalMaxSaleQty]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = stockStatus { dictionary[SerializationKeys.stockStatus] = value }
    if let value = qtyInCarts { dictionary[SerializationKeys.qtyInCarts] = value }
    if let value = qtyInStock { dictionary[SerializationKeys.qtyInStock] = value }
    if let value = maxSaleQty { dictionary[SerializationKeys.maxSaleQty] = value }
    if let value = limitedStockStatus { dictionary[SerializationKeys.limitedStockStatus] = value }
    if let value = nextAvailableDate { dictionary[SerializationKeys.nextAvailableDate] = value }
    if let value = atpLots { dictionary[SerializationKeys.atpLots] = value.map { $0.dictionaryRepresentation() } }
    if let value = stockType { dictionary[SerializationKeys.stockType] = value }
    if let value = originalMaxSaleQty { dictionary[SerializationKeys.originalMaxSaleQty] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.stockStatus = aDecoder.decodeObject(forKey: SerializationKeys.stockStatus) as? Int
    self.qtyInCarts = aDecoder.decodeObject(forKey: SerializationKeys.qtyInCarts) as? Int
    self.qtyInStock = aDecoder.decodeObject(forKey: SerializationKeys.qtyInStock) as? Int
    self.maxSaleQty = aDecoder.decodeObject(forKey: SerializationKeys.maxSaleQty) as? Int
    self.limitedStockStatus = aDecoder.decodeObject(forKey: SerializationKeys.limitedStockStatus) as? Int
    self.nextAvailableDate = aDecoder.decodeObject(forKey: SerializationKeys.nextAvailableDate) as? String
    self.atpLots = aDecoder.decodeObject(forKey: SerializationKeys.atpLots) as? [AtpLots]
    self.stockType = aDecoder.decodeObject(forKey: SerializationKeys.stockType) as? Int
    self.originalMaxSaleQty = aDecoder.decodeObject(forKey: SerializationKeys.originalMaxSaleQty) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(stockStatus, forKey: SerializationKeys.stockStatus)
    aCoder.encode(qtyInCarts, forKey: SerializationKeys.qtyInCarts)
    aCoder.encode(qtyInStock, forKey: SerializationKeys.qtyInStock)
    aCoder.encode(maxSaleQty, forKey: SerializationKeys.maxSaleQty)
    aCoder.encode(limitedStockStatus, forKey: SerializationKeys.limitedStockStatus)
    aCoder.encode(nextAvailableDate, forKey: SerializationKeys.nextAvailableDate)
    aCoder.encode(atpLots, forKey: SerializationKeys.atpLots)
    aCoder.encode(stockType, forKey: SerializationKeys.stockType)
    aCoder.encode(originalMaxSaleQty, forKey: SerializationKeys.originalMaxSaleQty)
  }

}
