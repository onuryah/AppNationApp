//
//  Cell.swift
//  AppNation
//
//  Created by Ceren Çapar on 3.02.2022.
//

import UIKit

class Cell: UITableViewCell {
    @IBOutlet weak var titleLabelField: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var descriptionLabelField: UILabel!
    @IBOutlet weak var scoreLabelField: UILabel!
    @IBOutlet weak var authorLabelField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
