//
//  ViewController.swift
//  GoalKeeper
//
//  Created by Kevin Weng on 7/27/19.
//  Copyright © 2019 Kevin Weng. All rights reserved.
//

import UIKit
import FirebaseDatabase

class GoalKeeperController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var goals: [Goal] = []
    var colors: [UIColor] = [UIColor(red:0.66, green:0.85, blue:0.92, alpha:1.0),
                            UIColor(red:0.67, green:0.59, blue:0.85, alpha:1.0),
                            UIColor(red:0.99, green:0.73, blue:0.83, alpha:1.0),
                            UIColor(red:1.00, green:1.00, blue:0.82, alpha:1.0)]
    var db: DatabaseReference!
    @IBOutlet weak var newGoalBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.db = Database.database().reference()
//        seed()
        
        // use this controller to set the data
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getGoals()
    }
    
    // TESTING ONLY
    // set initial data for firebase
    func seed() {
        let goals = [
            [
                "title": "Eat Chipotle Every Day",
                "text": "I love chipotle so much I need to eat it every day"
            ],
            [
                "title": "Eat Chipotle on Monday",
                "text": "I love chipotle so much I need to eat it every single monday"
            ]
        ]
        
        for goal in goals {
            self.db.child("goals").childByAutoId().setValue(goal)
        }
    }
    
    // in the future we'll probably replace this with a db call
    func getGoals() {
        var goals: [Goal] = []
        
        self.db.child("goals").observeSingleEvent(of: .value, with: {
            (snapshot) in
            let data = snapshot.value as! [String:AnyObject]
            for (key, goalData) in data {
                let goal = Goal(title: goalData["title"] as! String, bodyText: goalData["text"] as! String, key: key)
                goals.append(goal)
            }
            self.goals = goals
            self.tableView.reloadData()
        })
        
    }
}

extension GoalKeeperController: UITableViewDataSource, UITableViewDelegate {
    
    // sets the number of rows in a TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }

    // called when user deselects a table cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "transitionToGoalDetails", sender: goals[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cellSpacingHeight: CGFloat = 5
        return cellSpacingHeight
    }
    
    // called during segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "transitionToGoalDetails") {
            let detailsPage = segue.destination as! GoalDetailsViewController
            detailsPage.goal = sender as! Goal
        }
//        switch segue.identifier {
//        case "transitionToGoalDetails":
//            let detailsPage = segue.destination as! GoalDetailsViewController
//            detailsPage.goal = sender as! Goal
//        case "transitionToNewGoal":
//            print("went to new goals page")
//        default:
//            print("error. Segue broke")
//        }
    }
    
    // called everytime a new cell appears
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let goal = goals[indexPath.row]
        let color = self.colors[indexPath.row % 4]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as! GoalCell
        
        cell.setFields(title: goal.title, time: "10/20/19 4:19p.m.")
        cell.backgroundColor = color
        
        return cell
    }
}

