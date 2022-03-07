//
//  CategoryListTableViewCell.swift
//  Trivia
//
//  Created by Braian Theiler on 07/03/2022.
//

import UIKit

class CategoryListTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
