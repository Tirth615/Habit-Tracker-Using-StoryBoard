//
//  AddHabitViewController.swift
//  Habit-Tracker-Using-StoryBoard
//
//  Created by TirthShah on 14/05/25.
//

import UIKit

class AddHabitViewController: UIViewController {

    
    
    @IBOutlet weak var TxtHabitName: UITextField!
    @IBOutlet weak var TxtHabitDescription: UILabel!
    
    @IBOutlet weak var DatePicker: UIDatePicker!
    
    var hadit : [String : String] = [:]
    
    @IBAction func SaveBtn(_ sender: Any) {
        
        let name = TxtHabitName.text!
        let description = TxtHabitDescription.text!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from: DatePicker.date)

        let newHabit: [String: String] = [
            "name": name,
            "description": description,
            "date": dateString
        ]
        var habits = UserDefaults.standard.array(forKey: "Habits") as? [[String: String]] ?? []
        habits.append(newHabit)
        UserDefaults.standard.set(habits, forKey: "Habits")
        print("Habit Saved: \(newHabit)")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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
