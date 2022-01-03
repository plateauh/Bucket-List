//
//  BucketListViewController.swift
//  BucketList
//
//  Created by Najd Alsughaiyer on 27/12/2021.
//

import UIKit

class BucketListViewController: UITableViewController, NewItemViewDelegate {
    
    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editItemSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let newItemViewController = navigationController.topViewController as! NewItemViewController
        newItemViewController.delegate = self
        if segue.identifier == "editItemSegue" {
            let indexPath = sender as! NSIndexPath
            newItemViewController.item = items[indexPath.row]
            newItemViewController.indexPath = indexPath
        }
    }
    
    func itemSaved(by controller: NewItemViewController, with text: String, at indexPath: NSIndexPath?) {
        if let indexPath = indexPath {
            items[indexPath.row] = text
        }
        else {
            items.append(text)
        }
        tableView.reloadData()
        dismiss(animated: true)
    }
    
    func itemCanceled(by controller: NewItemViewController) {
        dismiss(animated: true)
    }
}

