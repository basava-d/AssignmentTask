//
//  APIManagerClass.swift
//  RedMartAssignmentTaskApp
//
//  Created by Basavaraj D on 04/08/2018.
//  Copyright © 2018 Basavaraj D. All rights reserved.
//

import Foundation
import ObjectMapper

protocol APIManagerProtocol {
  
  func getProductsList(urlEndPoint: String, success:@escaping (ProductsListModel, Int?) -> Void, failure:@escaping (String?,Int?) -> Void)
  func getProductsDetails(productId: String, success:@escaping (ProductDetailsModel, Int?) -> Void, failure:@escaping (String?,Int?) -> Void)
}

class APIManagerClass: APIManagerProtocol{
    
    static let sharedInstance = APIManagerClass()
    
    private init(){
        
    }
    
    public func getProductsList(urlEndPoint: String, success:@escaping (ProductsListModel, Int?) -> Void, failure:@escaping (String?,Int?) -> Void)
    {
        let urlString = Constants.BaseURL.rawValue + Constants.ProductsListEndPoint.rawValue + urlEndPoint
        ServiceHandler.sharedInstance.GETRequest(urlString: urlString, success: { (value, statusCode) in
            if let result = value{
                let data = result.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
                    let  model : ProductsListModel = Mapper<ProductsListModel>().map(JSONObject: json)!
                    success(model, statusCode)
                } catch let error as NSError {
                    failure(error.localizedDescription,0)
                }
            }else{
                failure("Something went wrong",0)
            }
            
        }) { (errorMessage, code) in
            failure(errorMessage,code)
        }
        
    }
    
    public func getProductsDetails(productId: String, success:@escaping (ProductDetailsModel, Int?) -> Void, failure:@escaping (String?,Int?) -> Void)
    {
        
        let urlString = Constants.BaseURL.rawValue + Constants.ProductDetailsEndPoint.rawValue + productId
        
        ServiceHandler.sharedInstance.GETRequest(urlString: urlString, success: { (value, statusCode) in
            
            if let result = value{
                let data = result.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
                    let  model : ProductDetailsModel = Mapper<ProductDetailsModel>().map(JSONObject: json)!
                    success(model, statusCode)
                } catch let error as NSError {
                    failure(error.localizedDescription,0)
                }
            }else{
                failure("Something went wrong",0)
            }
            
        }) { (errorMessage, code) in
            failure(errorMessage,code)
        }
        
    }
    
}
