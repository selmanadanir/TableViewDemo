//
//  UserTableViewCell.swift
//  TableViewDemo
//
//  Created by Selman ADANİR on 24.09.2022.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = .darkGray
        userLabel.textColor = .blue
        numberLabel.textColor = .yellow
    }
    
    func configureCell(user: String, number: String) {
        userLabel.text = user
        numberLabel.text = number
    }
}
