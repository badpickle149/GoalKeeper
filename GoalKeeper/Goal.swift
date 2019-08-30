//
//  Goal.swift
//  GoalKeeper
//
//  Created by Kevin Weng on 8/14/19.
//  Copyright © 2019 Kevin Weng. All rights reserved.
//

import Foundation

class Goal {
    
    var title: String
    var bodyText: String
    var key: String
    
    init(title: String, bodyText: String, key: String) {
        self.title = title
        self.bodyText = bodyText
        self.key = key
    }
}
