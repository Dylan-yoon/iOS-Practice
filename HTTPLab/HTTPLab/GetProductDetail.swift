//
//  GetProductDetail.swift
//  HTTPLab
//
//  Created by Dylan_Y on 2022/12/15.
//

import Foundation
// https://openmarket.yagom-academy.kr/api/products/32

struct GetProductDetail {
    let urlString = "https://openmarket.yagom-academy.kr/api/products/32"
    let urlSession = URLSession.shared
    
    func fetchData(completion: @escaping (Data) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        urlSession.dataTask(with: url) { data, response, error in
            if error != nil {
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200..<300).contains(response.statusCode) else {
                print("Response 오류")
                return
            }
            
            guard let data = data else {
                return
            }
            completion(data)
        }.resume()
    }
}

struct DetailList {
    let id: Int
    let vendor_id: Int
    let name: String
    let description: String
    let thumbnail: String
    let currency: Currency
    let price: Double
    let bargain_price: Double
    let discounted_price: Double
    let stock: Int
    let images: [Images]
    let vendors: Vendors
    let created_at: Date
    let issued_at: Date
}

struct Images: Decodable {
    let id: Int
    let url: String
    let thumbnail_url: String
    let issued_at: String
}

struct Vendors: Decodable {
    let id: Int
    let name: String
}
