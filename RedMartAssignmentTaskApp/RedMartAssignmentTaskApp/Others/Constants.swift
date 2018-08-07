//
//  Constants.swift
//  RedMartAssignmentTaskApp
//
//  Created by Basavaraj D on 03/08/2018.
//  Copyright © 2018 Basavaraj D. All rights reserved.
//

import Foundation

enum Constants: String {
  case BaseURL = "https://api.redmart.com/v1.6.0/"
  case ProductsListEndPoint = "catalog/search?theme=all-sales"
  case ProductDetailsEndPoint = "products/"
  case ImageBaseURL = "http://media.redmart.com/newmedia/200p"
  case ErrorMessage = "Failed"
  case SuccessMessage = "Success"
}
