//
//  BucketListViewController.swift
//  BucketList
//
//  Created by Najd Alsughaiyer on 27/12/2021.
//

import UIKit

class BucketListViewController: UITableViewController {

    var items = ["Hi", "How", "Are", "You?"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
}

