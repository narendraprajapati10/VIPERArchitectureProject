//
//  UniversityTableViewCell.swift
//  VIPERArchitectureProject
//
//  Created by WhyQ on 23/06/24.
//

import UIKit

class UniversityTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(forList university: University) {
        self.selectionStyle = .none
        titleLabel?.text = university.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
