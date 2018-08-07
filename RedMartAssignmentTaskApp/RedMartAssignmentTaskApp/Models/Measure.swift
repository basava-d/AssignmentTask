//
//  Measure.swift
//
//  Created by Basavaraj on 05/08/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Measure: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let w = "w"
    static let wtMetric = "wt_metric"
    static let wt = "wt"
    static let l = "l"
    static let volMetric = "vol_metric"
    static let volMetricAlt = "vol_metric_alt"
    static let h = "h"
  }

  // MARK: Properties
  public var w: Int?
  public var wtMetric: String?
  public var wt: Int?
  public var l: Int?
  public var volMetric: String?
  public var volMetricAlt: String?
  public var h: Int?

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
    w <- map[SerializationKeys.w]
    wtMetric <- map[SerializationKeys.wtMetric]
    wt <- map[SerializationKeys.wt]
    l <- map[SerializationKeys.l]
    volMetric <- map[SerializationKeys.volMetric]
    volMetricAlt <- map[SerializationKeys.volMetricAlt]
    h <- map[SerializationKeys.h]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = w { dictionary[SerializationKeys.w] = value }
    if let value = wtMetric { dictionary[SerializationKeys.wtMetric] = value }
    if let value = wt { dictionary[SerializationKeys.wt] = value }
    if let value = l { dictionary[SerializationKeys.l] = value }
    if let value = volMetric { dictionary[SerializationKeys.volMetric] = value }
    if let value = volMetricAlt { dictionary[SerializationKeys.volMetricAlt] = value }
    if let value = h { dictionary[SerializationKeys.h] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.w = aDecoder.decodeObject(forKey: SerializationKeys.w) as? Int
    self.wtMetric = aDecoder.decodeObject(forKey: SerializationKeys.wtMetric) as? String
    self.wt = aDecoder.decodeObject(forKey: SerializationKeys.wt) as? Int
    self.l = aDecoder.decodeObject(forKey: SerializationKeys.l) as? Int
    self.volMetric = aDecoder.decodeObject(forKey: SerializationKeys.volMetric) as? String
    self.volMetricAlt = aDecoder.decodeObject(forKey: SerializationKeys.volMetricAlt) as? String
    self.h = aDecoder.decodeObject(forKey: SerializationKeys.h) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(w, forKey: SerializationKeys.w)
    aCoder.encode(wtMetric, forKey: SerializationKeys.wtMetric)
    aCoder.encode(wt, forKey: SerializationKeys.wt)
    aCoder.encode(l, forKey: SerializationKeys.l)
    aCoder.encode(volMetric, forKey: SerializationKeys.volMetric)
    aCoder.encode(volMetricAlt, forKey: SerializationKeys.volMetricAlt)
    aCoder.encode(h, forKey: SerializationKeys.h)
  }

}
