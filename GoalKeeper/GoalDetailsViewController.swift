//
//  GoalDetailsViewController.swift
//  GoalKeeper
//
//  Created by Kevin Weng on 8/18/19.
//  Copyright © 2019 Kevin Weng. All rights reserved.
//

import UIKit

class GoalDetailsViewController: UIViewController {
    
    var goal = Goal(title:"", bodyText: "", key: "")

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = goal.bodyText
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
