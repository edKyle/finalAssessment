//
//  TableViewController.swift
//  final Assessment
//
//  Created by Kyle on 8/4/16.
//  Copyright © 2016 Alphacamp. All rights reserved.
//

import UIKit
import Photos

class TableViewController: UITableViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    static var image:UIImage?
    let userDefault = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadDatatoArray()
        
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.registerNib(nibName, forCellReuseIdentifier: "Cell")
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    override func viewDidAppear(animated: Bool) {
        self.loadDatatoArray()
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PictureData.pictureImageArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        
        cell.PictureImageView.image = PictureData.pictureImageArray[indexPath.row]
        cell.dataLabel.text = PictureData.nameArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showBigPicture", sender: indexPath.row)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showBigPicture"{
            BigPictureViewController.index = sender as? Int
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete && PictureData.pictureArray.count>0 && PictureData.nameArray.count>0{
            PictureData.pictureArray.removeAtIndex(indexPath.row)
            PictureData.nameArray.removeAtIndex(indexPath.row)
            
            userDefault.setObject(PictureData.nameArray, forKey: "name")
            userDefault.setObject(PictureData.pictureArray, forKey: "picture")
            
            self.loadDatatoArray()
            self.tableView.reloadData()
        }
    }
    
    
    
    
    
    
    
    @IBAction func cameraButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            // Load camera interface
            
            let picker = UIImagePickerController()
            picker.sourceType = .Camera
            picker.delegate = self
            picker.allowsEditing = false
            picker.sourceType = .Camera
            self.presentViewController(picker, animated: true, completion: nil)
            
        } else {
            // No camera available
            let alert = UIAlertController(title: "Error", message: "There is no camera available", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .Cancel, handler: nil))
                
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject]) {

        TableViewController.image = info["UIImagePickerControllerOriginalImage"] as? UIImage
       
        self.dismissViewControllerAnimated(true) { 
            self.performSegueWithIdentifier("saveSegue", sender: self)
        }
}
    
    func loadDatatoArray(){
        if userDefault.boolForKey("already") == true {
        
        PictureData.pictureArray = userDefault.objectForKey("picture") as! [NSData]
        PictureData.nameArray = userDefault.objectForKey("name") as! [String]
        PictureData.pictureImageArray = []
            for n in PictureData.pictureArray{
                let image = UIImage(data:n,scale:1)
                PictureData.pictureImageArray.append(image!)
            }
        
        }
    }
      /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
