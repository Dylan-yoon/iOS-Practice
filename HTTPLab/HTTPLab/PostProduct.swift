//
//  PostProduct.swift
//  HTTPLab
//
//  Created by Dylan-Y on 2022/12/17.
//

import Foundation
import UIKit

struct PostProduct {
    let urlString = "https://openmarket.yagom-academy.kr/api/products"
    let urlSession = URLSession.shared
    
    func postData(completion: @escaping (Data) -> Void) {
        // Host: example.org
        guard let url = URL(string: urlString) else { return }
        var urlRequest = URLRequest(url: url)
        
        // POST /test.html HTTP/1.1
        urlRequest.httpMethod = "POST"
        
        //boundary
        let boundary = UUID().uuidString
        
        // header
        urlRequest.addValue("c5b13912-43b9-11ed-8b9b-0956155ef06a", forHTTPHeaderField: "identifier")
        urlRequest.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        // Body
        guard let subak = UIImage(named: "subak") else {
            print("이미지없음")
            return
        }
        print("이미지 있음", subak)
        
        var bodyData = Data()
        let bodySpacing = "\r\n"
        //Params 시작
        let body1 = "--\(boundary)" + bodySpacing
        let body2 = "Content-Disposition: form-data; name=\"params\"" + "\r\n" + "Content-Type: application/json" + bodySpacing
        let body3 = "" + bodySpacing
        let body4 = "{\"name\": \"맛있는 수박 팝니다\", \"description\": \"아따이것참맛잇구마잉!!!\", \"price\": 1000000, \"currency\":  \"USD\", \"discounted_price\":  10000, \"stock\":  10, \"secret\": \"soobak1234\" }" + bodySpacing
        //PARAMS 끝
        bodyData.append(body1.data(using: .utf8)!)
        bodyData.append(body2.data(using: .utf8)!)
        bodyData.append(body3.data(using: .utf8)!)
        bodyData.append(body4.data(using: .utf8)!)
        
        //Images 시작
        let body5 = "--\(boundary)" + bodySpacing
        let body6 = "Content-Disposition: form-data; name=\"images\"; filename=\"subak.png\"" + bodySpacing
        let body7 = "Content-Type: image/png" + bodySpacing
        let body8 = "" + bodySpacing
        guard let body9 = subak.pngData() else {
            print("수박이안들어가 ㅠ")
            return
        }
        //Images 끝
        bodyData.append(body5.data(using: .utf8)!)
        bodyData.append(body6.data(using: .utf8)!)
        bodyData.append(body7.data(using: .utf8)!)
        bodyData.append(body8.data(using: .utf8)!)
        bodyData.append(body9)
        bodyData.append(bodySpacing.data(using: .utf8)!)
        
        let bodyEnd = "--\(boundary)--"
        bodyData.append(bodyEnd.data(using: .utf8)!)
        
        urlRequest.httpBody = bodyData
        print(bodyData)
        
        print("dataTask 시작!")
        
        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error.localizedDescription
                )
            }
            
            //에러 코드를 확인하기 위해 guard 분리
            guard let response = response as? HTTPURLResponse else {
                return
            }
            print(response.statusCode)
            
            guard (200..<300).contains(response.statusCode) else {
                print("응답없음")
                return
            }
            
            guard let data = data else {
                return
            }
            completion(data)
        }.resume()
    }
}
