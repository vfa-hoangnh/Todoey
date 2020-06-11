//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoViewController: UITableViewController {
    var taskArray = [Task]()
    //let defaults = UserDefaults.standard
    //let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
 
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }
   
    @IBAction func onAddPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add new items", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default){(action) in
            let textField = alert.textFields![0] as UITextField
            let newTask = Task(context: self.context)
            newTask.name = textField.text!
            newTask.done = false
            self.taskArray.append(newTask)
            self.saveItems()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel!.text = taskArray[indexPath.row].name
        cell.accessoryType = taskArray[indexPath.row].done ? .checkmark : .none
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //taskArray[indexPath.row].done = !taskArray[indexPath.row].done
        //taskArray[indexPath.row].setValue("new one", forKey: "name")
        context.delete(taskArray[indexPath.row])
        taskArray.remove(at: indexPath.row)
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func saveItems(){
        do{
            try context.save()
        }catch{
            print("Error save item: \(error)")
        }
        self.tableView.reloadData()
    }
    func loadItems(){
           let request : NSFetchRequest<Task> = Task.fetchRequest()
        do{
            taskArray = try context.fetch(request)
           print(taskArray)
           // print(result)
        }catch{
            print("Error load item: \(error)")
        }
    }
}


