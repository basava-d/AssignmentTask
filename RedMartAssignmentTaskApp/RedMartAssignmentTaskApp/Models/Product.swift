//
//  Product.swift
//
//  Created by Basavaraj on 05/08/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Product: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let img = "img"
    static let pricing = "pricing"
    static let filters = "filters"
    static let measure = "measure"
    static let details = "details"
    static let warehouse = "warehouse"
    static let types = "types"
    static let desc = "desc"
    static let sku = "sku"
    static let productLife = "product_life"
    static let id = "id"
    static let categories = "categories"
    static let inventory = "inventory"
    static let title = "title"
    static let images = "images"
  }

  // MARK: Properties
  public var img: Img?
  public var pricing: Pricing?
  public var filters: Filters?
  public var measure: Measure?
  public var details: Details?
  public var warehouse: Warehouse?
  public var types: [Int]?
  public var desc: String?
  public var sku: String?
  public var productLife: ProductLife?
  public var id: Int?
  public var categories: [Int]?
  public var inventory: Inventory?
  public var title: String?
  public var images: [Images]?

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
    img <- map[SerializationKeys.img]
    pricing <- map[SerializationKeys.pricing]
    filters <- map[SerializationKeys.filters]
    measure <- map[SerializationKeys.measure]
    details <- map[SerializationKeys.details]
    warehouse <- map[SerializationKeys.warehouse]
    types <- map[SerializationKeys.types]
    desc <- map[SerializationKeys.desc]
    sku <- map[SerializationKeys.sku]
    productLife <- map[SerializationKeys.productLife]
    id <- map[SerializationKeys.id]
    categories <- map[SerializationKeys.categories]
    inventory <- map[SerializationKeys.inventory]
    title <- map[SerializationKeys.title]
    images <- map[SerializationKeys.images]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = img { dictionary[SerializationKeys.img] = value.dictionaryRepresentation() }
    if let value = pricing { dictionary[SerializationKeys.pricing] = value.dictionaryRepresentation() }
    if let value = filters { dictionary[SerializationKeys.filters] = value.dictionaryRepresentation() }
    if let value = measure { dictionary[SerializationKeys.measure] = value.dictionaryRepresentation() }
    if let value = details { dictionary[SerializationKeys.details] = value.dictionaryRepresentation() }
    if let value = warehouse { dictionary[SerializationKeys.warehouse] = value.dictionaryRepresentation() }
    if let value = types { dictionary[SerializationKeys.types] = value }
    if let value = desc { dictionary[SerializationKeys.desc] = value }
    if let value = sku { dictionary[SerializationKeys.sku] = value }
    if let value = productLife { dictionary[SerializationKeys.productLife] = value.dictionaryRepresentation() }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = categories { dictionary[SerializationKeys.categories] = value }
    if let value = inventory { dictionary[SerializationKeys.inventory] = value.dictionaryRepresentation() }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = images { dictionary[SerializationKeys.images] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.img = aDecoder.decodeObject(forKey: SerializationKeys.img) as? Img
    self.pricing = aDecoder.decodeObject(forKey: SerializationKeys.pricing) as? Pricing
    self.filters = aDecoder.decodeObject(forKey: SerializationKeys.filters) as? Filters
    self.measure = aDecoder.decodeObject(forKey: SerializationKeys.measure) as? Measure
    self.details = aDecoder.decodeObject(forKey: SerializationKeys.details) as? Details
    self.warehouse = aDecoder.decodeObject(forKey: SerializationKeys.warehouse) as? Warehouse
    self.types = aDecoder.decodeObject(forKey: SerializationKeys.types) as? [Int]
    self.desc = aDecoder.decodeObject(forKey: SerializationKeys.desc) as? String
    self.sku = aDecoder.decodeObject(forKey: SerializationKeys.sku) as? String
    self.productLife = aDecoder.decodeObject(forKey: SerializationKeys.productLife) as? ProductLife
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.categories = aDecoder.decodeObject(forKey: SerializationKeys.categories) as? [Int]
    self.inventory = aDecoder.decodeObject(forKey: SerializationKeys.inventory) as? Inventory
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.images = aDecoder.decodeObject(forKey: SerializationKeys.images) as? [Images]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(img, forKey: SerializationKeys.img)
    aCoder.encode(pricing, forKey: SerializationKeys.pricing)
    aCoder.encode(filters, forKey: SerializationKeys.filters)
    aCoder.encode(measure, forKey: SerializationKeys.measure)
    aCoder.encode(details, forKey: SerializationKeys.details)
    aCoder.encode(warehouse, forKey: SerializationKeys.warehouse)
    aCoder.encode(types, forKey: SerializationKeys.types)
    aCoder.encode(desc, forKey: SerializationKeys.desc)
    aCoder.encode(sku, forKey: SerializationKeys.sku)
    aCoder.encode(productLife, forKey: SerializationKeys.productLife)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(categories, forKey: SerializationKeys.categories)
    aCoder.encode(inventory, forKey: SerializationKeys.inventory)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(images, forKey: SerializationKeys.images)
  }

}
