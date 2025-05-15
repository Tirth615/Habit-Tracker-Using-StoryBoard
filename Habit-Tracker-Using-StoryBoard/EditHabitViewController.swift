//
//  EditHabitViewController.swift
//  Habit-Tracker-Using-StoryBoard
//
//  Created by TirthShah on 14/05/25.
//

import UIKit

class EditHabitViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    @IBOutlet weak var LblName: UILabel!
    @IBOutlet weak var LblDescription: UILabel!
    @IBOutlet weak var LblDate: UILabel!
    
    @IBOutlet weak var DatePicker: UIDatePicker!
    
    @IBOutlet weak var LblDaysStrek: UILabel!
    
    var date = [String]()
    
    @IBAction func CompleteBtn(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: DatePicker.date)
        
        date.append(dateString)
        UserDefaults.standard.set(date, forKey: "\(name)")
        MyTableView.reloadData()
        LblDaysStrek.text = "\(date.count) Days Strek"
        
        
    }
    
    
    @IBOutlet weak var MyTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return date.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = date[indexPath.row]
        return cell
    }
    
    
    
    var name = ""
    var descriptionText = ""
    var dateValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let saveddate = UserDefaults.standard.array(forKey: "\(name)") as? [String] {
            date = saveddate
            MyTableView.reloadData()
            LblDaysStrek.text = "\(date.count) Days Strek"
        }
        LblDate.text = dateValue
        LblName.text = name
        LblDescription.text = descriptionText
        print(name,descriptionText,date)
        self.MyTableView.dataSource = self
        self.MyTableView.delegate = self

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
