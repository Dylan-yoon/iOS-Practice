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
    }
    
    func jsonDecoding() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAssets = NSDataAsset(name: "sample") else { return }
        
        do {
            sample = try jsonDecoder.decode([SampleJSON].self, from: dataAssets.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

//DataSource
extension MainTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? UITableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

//DelegateSource
extension MainTableViewController {
    
}
