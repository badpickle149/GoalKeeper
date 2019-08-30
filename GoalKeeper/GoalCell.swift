//
//  GoalCell.swift
//  GoalKeeper
//
//  Created by Kevin Weng on 8/14/19.
//  Copyright © 2019 Kevin Weng. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    
//    @IBOutlet weak var bodyText: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    
    func setFields(title: String, time: String) {
        self.dueDate.text = time
        self.dueDate.font = self.dueDate.font.withSize(20)
        self.title.text = title
        self.title.font = self.title.font.withSize(20)
    }
}
