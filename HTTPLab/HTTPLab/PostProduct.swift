//
//  PostProduct.swift
//  HTTPLab
//
//  Created by Byunghee_Yoon on 2022/12/17.
//

import Foundation
import UIKit

struct PostProduct {
    let urlString = "https://openmarket.yagom-academy.kr/api/products"
    let urlSession = URLSession.shared
    
    func postData() {
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
        guard let subak = UIImage(systemName: "subak.png") else {
            print("이미지없음")
            return
        }
        
        let body1 = "--\(boundary)"
        let body2 = "Content-Disposition: form-data; name=\"params\"" +
        "\r\n" + "Content-Type: application/json"
        let body3 = ""
        let body4 = "{ \"name\": \"맛있는 수박 팝니다\", \"description\": \"아따이것참맛잇구마잉!!!\", \"price\": 1000000, \"currency\":  \"USD\", \"discounted_price\":  10000, \"stock\":  10, \"secret\": \"soobak1234\" }"
        let body5 = "--\(boundary)"
        let body6 = "Content-Disposition: form-data; name=\"images\""
        let body7 = "Content-Type: image/png"
        let body8 = ""
        guard let body9 = String(data: subak.pngData()! , encoding: .utf8) else {return}
        let body10 = "--\(boundary)--"
        
        let bodys = [body1,
                     body2,
                     body3,
                     body4,
                     body5,
                     body6,
                     body7,
                     body8,
                     body9].map {
            ($0 + "\r\n")
        }
        
        let body: String = bodys.reduce("") { $0 + $1 } + body10
        print(body)
        
        urlRequest.httpBody = body.data(using: .utf8)
    }
}
//            POST /api/products HTTP/1.1
//            Host: {{host}}
//            identifier: c5b13912-43b9-11ed-8b9b-0956155ef06a
//            Content-Length: 444
//            Content-Type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW
//
//            ----WebKitFormBoundary7MA4YWxkTrZu0gW
//            Content-Disposition: form-data; name="params"
//            Content-Type: application/json
//
//            { "name": "ttt", "description": "t1t1t1", "price": 10000, "currency":  "KRW", "discounted_price":  500, "stock":  1234567, "secret": "soobak1234" }
//            ----WebKitFormBoundary7MA4YWxkTrZu0gW
//            Content-Disposition: form-data; name="images"; filename="dark_logo.png"
//            Content-Type: image/png
//
//            (data)
//            ----WebKitFormBoundary7MA4YWxkTrZu0gW




//
//        POST /test.html HTTP/1.1
//        Host: example.org
//        Content-Type: multipart/form-data;boundary="boundary"  // header
//
//        --boundary                                                //body1
//        Content-Disposition: form-data; name="field1"             //body2
//                                                                  //body3
//        value1                                                    //body4
//        --boundary                                                //body5
//        Content-Disposition: form-data; name="field2"; filename="example.txt"     //body6
//                                                                  //body7
//        value2                                                    //body8
//        --boundary--                                              //body9
