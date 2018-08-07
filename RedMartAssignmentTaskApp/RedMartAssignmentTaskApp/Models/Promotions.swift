//
//  Promotions.swift
//
//  Created by Basavaraj D on 04/08/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Promotions: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let currentProductGroupId = "current_product_group_id"
    static let promoLabel = "promo_label"
    static let savingsText = "savings_text"
    static let id = "id"
    static let type = "type"
  }

  // MARK: Properties
  public var currentProductGroupId: Int?
  public var promoLabel: String?
  public var savingsText: String?
  public var id: Int?
  public var type: Int?

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
    currentProductGroupId <- map[SerializationKeys.currentProductGroupId]
    promoLabel <- map[SerializationKeys.promoLabel]
    savingsText <- map[SerializationKeys.savingsText]
    id <- map[SerializationKeys.id]
    type <- map[SerializationKeys.type]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = currentProductGroupId { dictionary[SerializationKeys.currentProductGroupId] = value }
    if let value = promoLabel { dictionary[SerializationKeys.promoLabel] = value }
    if let value = savingsText { dictionary[SerializationKeys.savingsText] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.currentProductGroupId = aDecoder.decodeObject(forKey: SerializationKeys.currentProductGroupId) as? Int
    self.promoLabel = aDecoder.decodeObject(forKey: SerializationKeys.promoLabel) as? String
    self.savingsText = aDecoder.decodeObject(forKey: SerializationKeys.savingsText) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.type = aDecoder.decodeObject(forKey: SerializationKeys.type) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(currentProductGroupId, forKey: SerializationKeys.currentProductGroupId)
    aCoder.encode(promoLabel, forKey: SerializationKeys.promoLabel)
    aCoder.encode(savingsText, forKey: SerializationKeys.savingsText)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(type, forKey: SerializationKeys.type)
  }

}
