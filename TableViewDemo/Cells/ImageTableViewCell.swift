//
//  ImageTableViewCell.swift
//  TableViewDemo
//
//  Created by Selman ADANİR on 24.09.2022.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var planetImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configureCell(imageString: String) {
        planetImage.image = UIImage(named: imageString)
    }
}
