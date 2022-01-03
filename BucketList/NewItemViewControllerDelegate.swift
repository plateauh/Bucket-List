//
//  NewItemViewControllerDelegate.swift
//  BucketList
//
//  Created by Najd Alsughaiyer on 03/01/2022.
//

import UIKit
protocol NewItemViewDelegate: AnyObject {
    func itemSaved(by controller: NewItemViewController, with text: String, at indexPath: NSIndexPath?)
    func itemCanceled(by controller: NewItemViewController)
}
