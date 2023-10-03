//
//  ProductModel.swift
//  MVVMPattern
//
//  Created by Shouaib Ahmed on 26/09/23.
//

import Foundation

// MARK: - ProductModel
struct ProductModel: Codable {
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let category: String?
    let image: String?
    let rating: Rating?
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double?
    let count: Int?
}
