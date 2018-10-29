//
//  CommentCell.swift
//  comment2
//
//  Created by giuseppe longobardi on 21/10/2018.
//  Copyright © 2018 giuseppe longobardi. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet  var commentLabel: UILabel!
    @IBOutlet var commentImg: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
