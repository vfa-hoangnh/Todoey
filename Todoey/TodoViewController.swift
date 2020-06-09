//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoViewController: UITableViewController {
    var taskArray = [Task]()
    let defaults = UserDefaults.standard
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...5{
            let task = Task()
            task.name = "Name \(i)"
            task.isDone = true
            taskArray.append(task)
        }
        /*if let item = defaults.array(forKey: "Tasks") as? [Task]{
            taskArray = item
        }*/
    }
    @IBAction func onAddPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add new items", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default){(action) in
            let textField = alert.textFields![0] as UITextField
            let newTask = Task()
            newTask.name = textField.text!
            newTask.isDone = false
            self.taskArray.append(newTask)
            //self.defaults.set(self.taskArray, forKey: "Tasks")
            self.tableView.reloadData()
            }
        alert.addTextField { (UITextField) in
            UITextField.placeholder = "Place holder"
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }

    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
       let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
       // Configure the cell’s contents.
        cell.textLabel!.text = taskArray[indexPath.row].name
//        if taskArray[indexPath.row].isDone == true{
            cell.accessoryType = taskArray[indexPath.row].isDone ? .checkmark : .none
  //      }else{
    //        cell.accessoryType = .none
            
      //  }
       return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*if taskArray[indexPath.row].isDone == true{
            taskArray[indexPath.row].isDone = false
        }else{
            taskArray[indexPath.row].isDone = true
        }*/
        taskArray[indexPath.row].isDone = !taskArray[indexPath.row].isDone
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


