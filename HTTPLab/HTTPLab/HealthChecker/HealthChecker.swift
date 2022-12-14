//
//  HealthChecker.swift
//  HTTPLab
//
//  Created by Dylan_Y on 2022/12/14.
//

import Foundation

struct HealthChecker {
    let healthCheckURL = "https://openmarket.yagom-academy.kr/healthChecker"
    let urlsession = URLSession.shared
    
    func fetchData(completion: @escaping (Data) -> Void) {
        guard let url = URL(string: healthCheckURL) else {
            return
        }
        
        urlsession.dataTask(with: url) { data, response, error in
            //에러 발생시
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            // Response
            guard let response = response as? HTTPURLResponse,
                  (200..<300).contains(response.statusCode) else {
                return
            }
            
            // Data
            guard let data = data else {
                return
            }
            completion(data)
        }.resume()
    }
}
