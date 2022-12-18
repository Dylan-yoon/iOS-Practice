//
//  ViewController.swift
//  HTTPLab
//
//  Created by Dylan on 2022/12/14.
//

import UIKit

class ViewController: UIViewController {
    let post = PostProduct()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func postData() {
        post.postData { data in
            print("E N D")
            return
        }
    }
}

