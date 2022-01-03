//
//  NewItemViewController.swift
//  BucketList
//
//  Created by Najd Alsughaiyer on 27/12/2021.
//

import UIKit

class NewItemViewController: UITableViewController {

    @IBOutlet weak var itemTF: UITextField!
    weak var delegate: NewItemViewDelegate?
    var item: String?
    var indexPath: NSIndexPath?
    
    @IBAction func saveButtonPressed2(_ sender: UIBarButtonItem) {
        delegate?.itemSaved(by: self, with: itemTF.text!, at: indexPath)
    }
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.itemCanceled(by: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTF.text = item
    }
}
