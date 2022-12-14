//
//  GetProducts.swift
//  HTTPLab
//
//  Created by Dylan_Y on 2022/12/15.
//

import Foundation

struct GetProduct {
    let baseURL = "https://openmarket.yagom-academy.kr"
    let path = "/api/products" //?
    let pageNo_Quary = "page_no=1" //&
    let itemPerPage_Quary = "items_per_page=10"
    
    let urlSession = URLSession.shared
    
    func fetchData(completion: @escaping (Data) -> Void) {
        guard let url = URL(string: "https://openmarket.yagom-academy.kr/api/products?page_no=1&items_per_page=5") else {
            return
        }
        
        urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200..<300).contains(response.statusCode) else {
                return
            }
            
            guard let data = data else {
                return
            }
            completion(data)
        }.resume()
    }
}

struct ProductList: Decodable {
    let pageNo: Int
    let itemsPerPage: Int
    let totalCount: Int
    let offset: Int
    let limit: Int
    let lastPage: Int
    let hasNext: Bool
    let hasPrev: Bool
    let pages: [JsonArray]
}

struct JsonArray: Decodable {
    let id: Int
    let vendor_id: Int
    let vendorName: String
    let name: String
    let description: String
    let thumbnail: String
    let currency: Currency
    let price: Double
    let bargain_price: Double
    let discounted_price: Double
    let stock: Int
    let created_at: Data
    let issued_at: Data
}

enum Currency: Decodable {
    case KRW
    case USD
}
