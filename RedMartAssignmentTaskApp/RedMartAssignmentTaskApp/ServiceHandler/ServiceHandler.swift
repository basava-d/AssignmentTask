//
//  ServiceHandler.swift
//  RedMartAssignmentTaskApp
//
//  Created by Basavaraj D on 04/08/2018.
//  Copyright © 2018 Basavaraj D. All rights reserved.
//

import Foundation
import ObjectMapper

protocol ServiceHandlerProtocol {
  func GETRequest(urlString : String,success:@escaping (String?, Int?) -> Void, failure:@escaping (String?,Int?) -> Void)
}

class ServiceHandler : ServiceHandlerProtocol{
    
    static let sharedInstance = ServiceHandler()
    
    private init(){
        
    }
    
    public func GETRequest(urlString : String,success:@escaping (String?, Int?) -> Void, failure:@escaping (String?,Int?) -> Void)
    {
        
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                failure(error?.localizedDescription, 0)
                return
            }
            let responseString = String(data: data, encoding: .utf8)
            success(responseString, 200)
        }
        task.resume()
    }
}
