//
//  APIManager.swift
//  WeatherApp
//
//  Created by Artur Anissimov on 23.02.2020.
//  Copyright © 2020 Artur Anissimov. All rights reserved.
//

import Foundation

typealias JSONTask = URLSessionDataTask
typealias JSONCompletionHandler = ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void 

protocol APIManager {
    
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    func JSONTaskWith(request: URLRequest, completionHandler: JSONCompletionHandler)  -> JSONTask
    
    init(sessionConfiguration: URLSessionConfiguration)
}
