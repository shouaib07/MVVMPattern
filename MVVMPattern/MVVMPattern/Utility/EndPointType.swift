//
//  EndPointType.swift
//  MVVMPattern
//
//  Created by Shouaib Ahmed on 03/10/23.
//

import Foundation

enum HTTPMethods: String{
    case get = "GET"
    case post = "POST"
}

protocol EndPointType{
    var path: String{get}
    var baseUrl: String{get}
    var url: URL? {get}
    var method: HTTPMethods{get}
}

enum EndPointItems{
    case products
}
//https://fakestoreapi.com/products
extension EndPointItems: EndPointType{
    var path: String {
        switch self{
        case .products:
            return "products"
        }
    }
    
    var baseUrl: String {
        return "https://fakestoreapi.com/"
    }
    
    var url: URL? {
        return URL(string: "\(baseUrl)\(path)")
    }
    
    var method: HTTPMethods {
        switch self{
        case .products:
            return .get
        }
    }
    
    
}
