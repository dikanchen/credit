//
//  NetworkService.swift
//  Incognito
//
//  Created by User on 2/20/18.
//  Copyright © 2018 raywenderlich. All rights reserved.
//

import UIKit

enum NetworkErrors: Error{
  case httpError (code: Int)
  case badURL
  case noData
}

enum ParsingErrors: Error{
  case objectNotDictionary
  case noObjectCalled(String)
}

class NetworkService{
  class func GetPeople(completion:@escaping ([card]?, Error?) -> ()){
    guard let url = URL(string: "https://api-sandbox.capitalone.com/credit-offers/products?limit=50&offset=0") else {return}
    let session = URLSession.shared
    let task = session.dataTask(with: url) {
      (data, response, error) in
      if let error = error{
        completion(nil, error)
        return
      }
      guard let data = data else {
        completion(nil, NetworkErrors.noData)
        return
      }
      do{
        let jsonObject = try JSONSerialization.jsonObject(with: data)
        guard let dictionary = jsonObject as? [String:Any] else {
          completion(nil, ParsingErrors.objectNotDictionary)
          return
        }
        guard let result = dictionary["products"] as? [[String:Any]] else {
          completion(nil, ParsingErrors.noObjectCalled("people"))
          return
        }
        let products:[card] = result.flatMap{
          guard let productDisplayName = $0["productDisplayName"] as? String else {return nil}
          
          return card(productDisplayName: productDisplayName)
        }
        completion(products, nil)
      } catch let error{
        completion(nil, error)
      }
    }
    task.resume()
  }
}
