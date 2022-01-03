//
//  BucketListViewController.swift
//  BucketList
//
//  Created by Najd Alsughaiyer on 27/12/2021.
//

import UIKit
import CoreData

class BucketListViewController: UITableViewController, NewItemViewDelegate {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title!
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editItemSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        managedObjectContext.delete(item)
        saveContext()
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let newItemViewController = navigationController.topViewController as! NewItemViewController
        newItemViewController.delegate = self
        
        if sender is NSIndexPath {
            let indexPath = sender as! NSIndexPath
            newItemViewController.item = items[indexPath.row].title!
            newItemViewController.indexPath = indexPath
        }
    }
    
    func fetchAllItems() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            items = try managedObjectContext.fetch(request)
        } catch {
            print(error)
        }
    }
    
    func itemSaved(by controller: NewItemViewController, with text: String, at indexPath: NSIndexPath?) {
        if let indexPath = indexPath {
            items[indexPath.row].title = text
        }
        else {
            let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: managedObjectContext) as! Item
            item.title = text
            items.append(item)
        }
        saveContext()
        tableView.reloadData()
        dismiss(animated: true)
    }
    
    func itemCanceled(by controller: NewItemViewController) {
        dismiss(animated: true)
    }
}

