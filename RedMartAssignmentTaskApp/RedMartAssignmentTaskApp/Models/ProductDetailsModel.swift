//
//  ProductDetailsModel.swift
//
//  Created by Basavaraj on 05/08/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class ProductDetailsModel: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let total = "total"
    static let status = "status"
    static let page = "page"
    static let session = "session"
    static let pageSize = "page_size"
    static let product = "product"
  }

  // MARK: Properties
  public var total: Int?
  public var status: Status?
  public var page: Int?
  public var session: String?
  public var pageSize: Int?
  public var product: Product?

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
    total <- map[SerializationKeys.total]
    status <- map[SerializationKeys.status]
    page <- map[SerializationKeys.page]
    session <- map[SerializationKeys.session]
    pageSize <- map[SerializationKeys.pageSize]
    product <- map[SerializationKeys.product]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = total { dictionary[SerializationKeys.total] = value }
    if let value = status { dictionary[SerializationKeys.status] = value.dictionaryRepresentation() }
    if let value = page { dictionary[SerializationKeys.page] = value }
    if let value = session { dictionary[SerializationKeys.session] = value }
    if let value = pageSize { dictionary[SerializationKeys.pageSize] = value }
    if let value = product { dictionary[SerializationKeys.product] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.total = aDecoder.decodeObject(forKey: SerializationKeys.total) as? Int
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Status
    self.page = aDecoder.decodeObject(forKey: SerializationKeys.page) as? Int
    self.session = aDecoder.decodeObject(forKey: SerializationKeys.session) as? String
    self.pageSize = aDecoder.decodeObject(forKey: SerializationKeys.pageSize) as? Int
    self.product = aDecoder.decodeObject(forKey: SerializationKeys.product) as? Product
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(total, forKey: SerializationKeys.total)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(page, forKey: SerializationKeys.page)
    aCoder.encode(session, forKey: SerializationKeys.session)
    aCoder.encode(pageSize, forKey: SerializationKeys.pageSize)
    aCoder.encode(product, forKey: SerializationKeys.product)
  }

}
