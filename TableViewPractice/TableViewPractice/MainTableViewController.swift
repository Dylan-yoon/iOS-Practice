//
//  MainTableViewController.swift
//  TableViewPractice
//
//  Created by Byunghee_Yoon on 2022/10/21.
//

import UIKit

class MainTableViewController: UITableViewController {
    var sample = [SampleJSON]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonDecoding()
    }
    
    func jsonDecoding() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAssets: NSDataAsset = NSDataAsset(name: "sample") else { return }
        
        do {
            sample = try jsonDecoder.decode([SampleJSON].self, from: dataAssets.data)
        } catch {
            print(error.localizedDescription)
            print("jsonjsonjsonjson")
        }
        print("Success")
        print(sample.count)
    }
}

//DataSource
extension MainTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sample.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            
            print("cell Error")
            return TableViewCell()
        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        // 이렇게 가드문 처리하지 않는다면 아래서 Cell을 사용 할 수 없다.
        
        cell.userID.text = sample[indexPath.row].userId.description
        cell.id.text = sample[indexPath.row].id.description
        cell.title.text = sample[indexPath.row].title
        
        return cell
    }
}

//DelegateSource
extension MainTableViewController {
    
}
