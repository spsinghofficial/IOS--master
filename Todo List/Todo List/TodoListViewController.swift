//
//  ViewController.swift
//  Todo List
//
//  Created by surinder pal singh sidhu on 2019-04-20.
//  Copyright © 2019 Surinder Pal Singh Sidhu. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var itemArray = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCustomCell", for: indexPath)
     let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.isSet ? .checkmark : .none
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     itemArray[indexPath.row].isSet = !itemArray[indexPath.row].isSet
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addTodo(_ sender: Any) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new TODO", message: "", preferredStyle: .alert)
        let action =  UIAlertAction(title: "Add Item", style: .default) { (action) in
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.tableView.reloadData()
            
        }
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "enter todo here"
            textField = alertTextField        }
        present(alert, animated: true, completion: nil)
    }
    
}

