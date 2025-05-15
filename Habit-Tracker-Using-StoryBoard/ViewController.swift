//
//  ViewController.swift
//  Habit-Tracker-Using-StoryBoard
//
//  Created by TirthShah on 14/05/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var MyTableView: UITableView!
    
    var habits: [[String: String]] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let habit = habits[indexPath.row]
        
        cell.textLabel?.text = habit["name"] ?? "Unnamed Habit"
        cell.detailTextLabel?.text = "\(habit["description"] ?? "") - \(habit["date"] ?? "")"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let edit = self.storyboard?.instantiateViewController(withIdentifier: "edit") as! EditHabitViewController
        edit.name = habits[indexPath.row]["name"] ?? ""
        edit.descriptionText = habits[indexPath.row]["description"] ?? ""
        edit.dateValue = habits[indexPath.row]["date"] ?? ""
        self.navigationController?.pushViewController(edit,animated: true)
                                                      
    }

    @IBAction func AddBtn(_ sender: Any) {
        let habitVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addhabit") as! AddHabitViewController
        self.present(habitVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.MyTableView.dataSource = self
        self.MyTableView.delegate = self
        
        if let savedHabits = UserDefaults.standard.array(forKey: "Habits") as? [[String: String]] {
            print("savedHabits",savedHabits)
            habits = savedHabits
        }
        
        MyTableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let savedHabits = UserDefaults.standard.array(forKey: "Habits") as? [[String: String]] {
            habits = savedHabits
            MyTableView.reloadData()
        }
    }
}
