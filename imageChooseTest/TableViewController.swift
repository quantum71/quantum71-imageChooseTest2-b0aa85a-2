//
//  TableViewController.swift
//  imageChooseTest
//
//  Created by Eduardo Simpson on 10/6/16.
//  Copyright © 2016 Eduardo Simpson. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class TableViewController: UITableViewController {

    var memes: [Meme]{
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Table View"
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = false
    }

   override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("self.memes.count: \(self.memes.count)")
        return self.memes.count
        
    }
    
   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableViewCell")!
        let meme = self.memes[indexPath.row]
        cell.imageView?.image = meme.image
        //cell.textLabel?.text =
    
    
        return cell
    }

   override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as!MemeDetailViewController
        detailController.meme = self.memes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }

}
