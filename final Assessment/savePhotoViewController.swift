//
//  savePhotoViewController.swift
//  final Assessment
//
//  Created by Kyle on 8/5/16.
//  Copyright © 2016 Alphacamp. All rights reserved.
//

import UIKit

class savePhotoViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var saveField: UITextField!
    @IBOutlet weak var saveImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveField.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        
        saveImageView.image = TableViewController.image
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow() {
        self.view.frame.origin.y -= 200
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        saveField.resignFirstResponder()
        self.view.frame.origin.y += 200
        return true
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        if saveField.text != ""{
            let imageData: NSData = UIImageJPEGRepresentation(TableViewController.image!, 1)!
            PictureData.nameArray.append(saveField.text!)
            PictureData.pictureArray.append(imageData)
            
            let userDefault = NSUserDefaults.standardUserDefaults()
            
            userDefault.setObject(PictureData.nameArray, forKey: "name")
            userDefault.setObject(PictureData.pictureArray, forKey: "picture")
            userDefault.setBool(true, forKey: "already")
            userDefault.synchronize()
            
            self.navigationController!.popViewControllerAnimated(true)
            
        }else{
            let alert = UIAlertController(title: "type something", message: "please name the picture", preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
