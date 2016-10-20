//
//  PkmnTableViewCell.swift
//  BuildGuild
//
//  Created by Nick Krogstad on 10/19/16.
//  Copyright © 2016 BuildGuild. All rights reserved.
//

import UIKit

class PkmnTableViewCell: UITableViewCell {

    @IBOutlet weak var pkmnName: UILabel!
    @IBOutlet weak var pkmnSprite: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
