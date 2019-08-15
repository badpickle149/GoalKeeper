//
//  GoalCell.swift
//  GoalKeeper
//
//  Created by Kevin Weng on 8/14/19.
//  Copyright © 2019 Kevin Weng. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    
    @IBOutlet weak var bodyText: UILabel!
    @IBOutlet weak var title: UILabel!
    
    func setFields(body: String, title: String) {
        self.bodyText.text = body
        self.title.text = title
    }
}
