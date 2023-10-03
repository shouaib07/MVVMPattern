//
//  File.swift
//  MVVMPattern
//
//  Created by Shouaib Ahmed on 26/09/23.
//

import Foundation

final class ProductViewModel{
    
    var products: [ProductModel] = []
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchProducts(){
        eventHandler?(.loading)
        APIManager.shared.request(
            modelType: [ProductModel].self,
            type: EndPointItems.products) { response in
                self.eventHandler?(.stopLoading)
                switch response{
                case .success(let products):
                    print(products)
                    self.products = products
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    print(error)
                    self.eventHandler?(.error(error))
                }
            }
    }
    
//    func fetchProduct(){
//     
//        eventHandler?(.loading)
//        APIManager.shared.fetchProducts { response in
//            self.eventHandler?(.stopLoading)
//            switch response{
//            case .success(let products):
//                print(products)
//                self.products = products
//                self.eventHandler?(.dataLoaded)
//            case .failure(let error):
//                print(error)
//                self.eventHandler?(.error(error))
//            }
//        }
//    }
}

extension ProductViewModel{
 
    enum Event{
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
