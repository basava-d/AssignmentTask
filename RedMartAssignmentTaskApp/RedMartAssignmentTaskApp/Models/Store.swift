//
//  Store.swift
//
//  Created by Basavaraj D on 04/08/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Store: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let storeType = "store_type"
    static let name = "name"
    static let desc = "desc"
    static let id = "id"
    static let uri = "uri"
    static let mediaAssets = "media_assets"
  }

  // MARK: Properties
  public var storeType: String?
  public var name: String?
  public var desc: String?
  public var id: Int?
  public var uri: String?
  public var mediaAssets: MediaAssets?

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
    storeType <- map[SerializationKeys.storeType]
    name <- map[SerializationKeys.name]
    desc <- map[SerializationKeys.desc]
    id <- map[SerializationKeys.id]
    uri <- map[SerializationKeys.uri]
    mediaAssets <- map[SerializationKeys.mediaAssets]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = storeType { dictionary[SerializationKeys.storeType] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = desc { dictionary[SerializationKeys.desc] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = uri { dictionary[SerializationKeys.uri] = value }
    if let value = mediaAssets { dictionary[SerializationKeys.mediaAssets] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.storeType = aDecoder.decodeObject(forKey: SerializationKeys.storeType) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.desc = aDecoder.decodeObject(forKey: SerializationKeys.desc) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.uri = aDecoder.decodeObject(forKey: SerializationKeys.uri) as? String
    self.mediaAssets = aDecoder.decodeObject(forKey: SerializationKeys.mediaAssets) as? MediaAssets
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(storeType, forKey: SerializationKeys.storeType)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(desc, forKey: SerializationKeys.desc)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(uri, forKey: SerializationKeys.uri)
    aCoder.encode(mediaAssets, forKey: SerializationKeys.mediaAssets)
  }

}
