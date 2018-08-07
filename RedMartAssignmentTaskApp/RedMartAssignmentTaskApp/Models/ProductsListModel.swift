//
//  ProductsListModel.swift
//
//  Created by Basavaraj D on 04/08/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class ProductsListModel: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let page = "page"
    static let pageSize = "page_size"
    static let filters = "filters"
    static let facets = "facets"
    static let meta = "meta"
    static let onSaleCount = "on_sale_count"
    static let total = "total"
    static let products = "products"
    static let images = "images"
    static let title = "title"
  }

  // MARK: Properties
  public var status: Status?
  public var page: Int?
  public var pageSize: Int?
  public var filters: Filters?
  public var facets: Facets?
  public var meta: Meta?
  public var onSaleCount: Int?
  public var total: Int?
  public var products: [Products]?
  public var images: Images?
  public var title: String?

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
    status <- map[SerializationKeys.status]
    page <- map[SerializationKeys.page]
    pageSize <- map[SerializationKeys.pageSize]
    filters <- map[SerializationKeys.filters]
    facets <- map[SerializationKeys.facets]
    meta <- map[SerializationKeys.meta]
    onSaleCount <- map[SerializationKeys.onSaleCount]
    total <- map[SerializationKeys.total]
    products <- map[SerializationKeys.products]
    images <- map[SerializationKeys.images]
    title <- map[SerializationKeys.title]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value.dictionaryRepresentation() }
    if let value = page { dictionary[SerializationKeys.page] = value }
    if let value = pageSize { dictionary[SerializationKeys.pageSize] = value }
    if let value = filters { dictionary[SerializationKeys.filters] = value.dictionaryRepresentation() }
    if let value = facets { dictionary[SerializationKeys.facets] = value.dictionaryRepresentation() }
    if let value = meta { dictionary[SerializationKeys.meta] = value.dictionaryRepresentation() }
    if let value = onSaleCount { dictionary[SerializationKeys.onSaleCount] = value }
    if let value = total { dictionary[SerializationKeys.total] = value }
    if let value = products { dictionary[SerializationKeys.products] = value.map { $0.dictionaryRepresentation() } }
    if let value = images { dictionary[SerializationKeys.images] = value.dictionaryRepresentation() }
    if let value = title { dictionary[SerializationKeys.title] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Status
    self.page = aDecoder.decodeObject(forKey: SerializationKeys.page) as? Int
    self.pageSize = aDecoder.decodeObject(forKey: SerializationKeys.pageSize) as? Int
    self.filters = aDecoder.decodeObject(forKey: SerializationKeys.filters) as? Filters
    self.facets = aDecoder.decodeObject(forKey: SerializationKeys.facets) as? Facets
    self.meta = aDecoder.decodeObject(forKey: SerializationKeys.meta) as? Meta
    self.onSaleCount = aDecoder.decodeObject(forKey: SerializationKeys.onSaleCount) as? Int
    self.total = aDecoder.decodeObject(forKey: SerializationKeys.total) as? Int
    self.products = aDecoder.decodeObject(forKey: SerializationKeys.products) as? [Products]
    self.images = aDecoder.decodeObject(forKey: SerializationKeys.images) as? Images
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(page, forKey: SerializationKeys.page)
    aCoder.encode(pageSize, forKey: SerializationKeys.pageSize)
    aCoder.encode(filters, forKey: SerializationKeys.filters)
    aCoder.encode(facets, forKey: SerializationKeys.facets)
    aCoder.encode(meta, forKey: SerializationKeys.meta)
    aCoder.encode(onSaleCount, forKey: SerializationKeys.onSaleCount)
    aCoder.encode(total, forKey: SerializationKeys.total)
    aCoder.encode(products, forKey: SerializationKeys.products)
    aCoder.encode(images, forKey: SerializationKeys.images)
    aCoder.encode(title, forKey: SerializationKeys.title)
  }

}
