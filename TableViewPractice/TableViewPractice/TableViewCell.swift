//
//  TableViewCell.swift
//  TableViewPractice
//
//  Created by Byunghee_Yoon on 2022/10/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

/*
 let userID: Int
 let id: Int
 let title: String
 */
