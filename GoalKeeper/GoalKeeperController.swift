//
//  ViewController.swift
//  GoalKeeper
//
//  Created by Kevin Weng on 7/27/19.
//  Copyright © 2019 Kevin Weng. All rights reserved.
//

import UIKit

class GoalKeeperController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var goals: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goals = createData()
        
        // use this controller to set the data
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // in the future we'll probably replace this with a db call
    func createData() -> [Goal] {
        var goals: [Goal] = []
        
        let goal1 = Goal(title:"Sample", bodyText: "This is the first goal!")
        let goal2 = Goal(title:"Sample2", bodyText: "This is the second goal!")
        
        goals.append(goal1)
        goals.append(goal2)
        
        return goals
    }
}

extension GoalKeeperController: UITableViewDataSource, UITableViewDelegate {
    
    // sets the number of rows in a TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    // called everytime a new cell appears
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let goal = goals[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as! GoalCell
        
        cell.setFields(body: goal.bodyText, title: goal.title)
        
        return cell
    }
}

