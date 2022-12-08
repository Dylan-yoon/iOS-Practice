//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by Dylan_Y on 2022/12/07.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Name"
        textField.backgroundColor = .lightGray
        
        return textField
    }()
    
    let ageTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Age"
        textField.backgroundColor = .lightGray
        
        return textField
    }()
    
    let tableView = UITableView()
    
    var container: NSPersistentContainer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        guard container != nil else {
//            fatalError("This view needs a persistent container.")
//        }
        
        view.backgroundColor = .black
        
        [
        nameTextField,
        ageTextField,
        tableView
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemGreen
        
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            ageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: ageTextField.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    
}
