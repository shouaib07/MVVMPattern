//
//  APIManager.swift
//  MVVMPattern
//
//  Created by Shouaib Ahmed on 26/09/23.
//

import Foundation

enum DataError: Error{
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

typealias Handler = (Result<[ProductModel], DataError>) -> Void
final class APIManager{
    
    static let shared = APIManager()
    private init(){}
    
    
    func fetchProducts(completion: @escaping Handler) {
        
        guard let url = URL(string: Constant.API.productURL) else{
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
        
            guard let data, error == nil else{
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else{
                completion(.failure(.invalidResponse))

                return
            }
            
            do {
                let prodcuts = try JSONDecoder().decode([ProductModel].self, from: data)
                completion(.success(prodcuts))

            }catch{
                completion(.failure(.network(error)))
            }
        }.resume()
        
    }
}

