//
//  NewGoalViewController.swift
//  GoalKeeper
//
//  Created by Kevin Weng on 8/22/19.
//  Copyright © 2019 Kevin Weng. All rights reserved.
//

import UIKit
import FirebaseDatabase

class NewGoalViewController: UIViewController {
    
    var db: DatabaseReference!
    var goalTitle: String = ""
    var goalDesc: String = ""
    var goalDate: String = ""
    
    @IBOutlet weak var goalTitleTextEdit: UITextField!
    @IBOutlet weak var goalDescTextEdit: UITextView!
    @IBOutlet weak var goalTargetDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.db = Database.database().reference()
        
        goalTargetDatePicker.addTarget(self, action: #selector(NewGoalViewController.dateChanged(goalTargetDatePicker:)), for: .valueChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc func dateChanged(goalTargetDatePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy H:i:s"
        
        self.goalDate = dateFormatter.string(from: goalTargetDatePicker.date)
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
