//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoViewController: UITableViewController {
    //var taskArray = [Task]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTasks()
    }
    func loadTasks(){
        let task = Task()// not found entity ? ??
        //let task = Task
        //let task = Task(
       // let a = Task
    }
    @IBAction func onAddPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add new items", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default){(action) in
            let textField = alert.textFields![0] as UITextField
            //let context = (UIAp)
            //let newTask =
            //newTask.name = textField.text!
            //newTask.isDone = false
            //self.taskArray.append(newTask)
            //self.saveItems()
            //self.tableView.reloadData()
            }
        alert.addTextField { (UITextField) in
            UITextField.placeholder = "Place holder"
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return taskArray.count
        return 0
    }

    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        //cell.textLabel!.text = taskArray[indexPath.row].name
        //cell.accessoryType = taskArray[indexPath.row].isDone ? .checkmark : .none
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //taskArray[indexPath.row].isDone = !taskArray[indexPath.row].isDone
        saveItems()
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func saveItems(){
        
    }
}


