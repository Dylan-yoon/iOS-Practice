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
        textField.autocorrectionType = .no
        
        return textField
    }()
    
    let ageTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Age"
        textField.backgroundColor = .lightGray
        textField.autocorrectionType = .no
        
        return textField
    }()
    
    let addbutton: UIButton = {
        let button = UIButton()
        button.setTitle("ADD", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.darkGray, for: .normal)
        
        return button
    }()
    
    let printbutton: UIButton = {
        let button = UIButton()
        button.setTitle("PRINT", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.textAlignment = .center
        
        return button
    }()
    
    let tableView = UITableView()
    
    var container: NSPersistentContainer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        guard container != nil else {
        //            fatalError("This view needs a persistent container.")
        //        }
        
        view.backgroundColor = .black
        autoLayout()
        
    }
    
    @objc func tapAddButton() {
        guard let nameText = nameTextField.text else { return }
        guard let ageText = ageTextField.text,
              let ageText = Int(ageText) else { return }
        
        let person = PersonInfo(name: nameText, gender: true, age: ageText, uuid: UUID())
        person.coreDataRegist()
        print("저장완료")
    }
    
    @objc func tapPrintButton() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            let person = try context.fetch(Person.fetchRequest()) as! [Person]
            person.forEach {
                print($0.name!, $0.gender, $0.age)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}


extension ViewController {
    func autoLayout() {
        [
            nameTextField,
            ageTextField,
            addbutton,
            printbutton,
            tableView
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemGreen
        
        addbutton.addTarget(self, action: #selector(tapAddButton), for: .touchUpInside)
        printbutton.addTarget(self, action: #selector(tapPrintButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            ageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            addbutton.topAnchor.constraint(equalTo: ageTextField.bottomAnchor),
            addbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            printbutton.topAnchor.constraint(equalTo: ageTextField.bottomAnchor),
            printbutton.leadingAnchor.constraint(equalTo: addbutton.trailingAnchor),
            printbutton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: addbutton.bottomAnchor),
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
