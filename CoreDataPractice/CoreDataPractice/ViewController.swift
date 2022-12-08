//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by Dylan_Y on 2022/12/07.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard container != nil else {
            fatalError("This view needs a persistent container.")
        }
        
        view.backgroundColor = .black
    }
}
