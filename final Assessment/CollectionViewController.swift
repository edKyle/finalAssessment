//
//  CollectionViewController.swift
//  final Assessment
//
//  Created by Kyle on 8/4/16.
//  Copyright © 2016 Alphacamp. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import MessageUI

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, MKMapViewDelegate, CLLocationManagerDelegate, MFMailComposeViewControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "CollectionViewCell", bundle:nil)
        self.collectionView!.registerNib(nibName, forCellWithReuseIdentifier: "Cell")
        
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        
        let spacingWidth = Float(2)
        let width = (Float(UIScreen.mainScreen().bounds.width) - spacingWidth * Float(2+1)) / 2
        
        layout.itemSize = CGSize(width: CGFloat(width), height: CGFloat(width))
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 6
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        switch indexPath.item{
        case 0:
            cell.cellLabel.text = "顯示AlertView"
        case 1:
            cell.cellLabel.text = "顯示Actionsheet"
        case 2:
            cell.cellLabel.text = "撥打電話"
        case 3:
            cell.cellLabel.text = "開啟設定頁面"
        case 4:
            cell.cellLabel.text = "地圖導航"
        default:
            cell.cellLabel.text = "開啟信箱"
        }
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.item{
        case 0:
            let alert = UIAlertController(title: "Alert", message: "Hello", preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        case 1:
            let alert = UIAlertController(title: "ActionSheet", message: "Hello", preferredStyle: .ActionSheet)
            let action = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            let action2 = UIAlertAction(title: "action", style: .Default, handler: nil)
            alert.addAction(action)
            alert.addAction(action2)
            self.presentViewController(alert, animated: true, completion: nil)
        case 2:
            let phone = 117
            UIApplication.sharedApplication().openURL(NSURL(string: "tel://\(phone)")!)
        case 3:
            UIApplication.sharedApplication().openURL(NSURL(string:UIApplicationOpenSettingsURLString)!)
        case 4:
            let coordinate = CLLocationCoordinate2DMake(25.052289, 121.532259)
            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
            mapItem.name = "Alpha camp"
            mapItem.openInMapsWithLaunchOptions([MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
        default:
            let mailController = MFMailComposeViewController()
            mailController.mailComposeDelegate = self

            if MFMailComposeViewController.canSendMail(){
                mailController.setSubject("測試信件")
                mailController.setToRecipients(["alphacamp@gmail.com"])
                self.presentViewController(mailController, animated: true, completion: nil)
                
             }
            
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result:
        MFMailComposeResult, error: NSError?) {
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue:
            print("Mail cancelled")
            controller.dismissViewControllerAnimated(true, completion: nil)
        case MFMailComposeResultSaved.rawValue:
            print("Mail saved")
            controller.dismissViewControllerAnimated(true, completion: nil)
        case MFMailComposeResultSent.rawValue:
            print("Mail sent")
            controller.dismissViewControllerAnimated(true, completion: nil)
        case MFMailComposeResultFailed.rawValue:
            print("Mail sent failure.")
            controller.dismissViewControllerAnimated(true, completion: nil)
        default:
             controller.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    
    
    
    
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
     
     }
     */
    
}





