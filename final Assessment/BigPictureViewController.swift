//
//  BigPictureViewController.swift
//  final Assessment
//
//  Created by Kyle on 8/5/16.
//  Copyright © 2016 Alphacamp. All rights reserved.
//

import UIKit

class BigPictureViewController: UIViewController, UIScrollViewDelegate{
    
    static var index:Int?

    @IBOutlet weak var bigPictureNameLabel: UILabel!
    @IBOutlet weak var bigPictureImageView: UIImageView!
    @IBOutlet weak var bigPictureScrow: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bigPictureImageView.image = PictureData.pictureImageArray[BigPictureViewController.index!]
        bigPictureNameLabel.text = PictureData.nameArray[BigPictureViewController.index!]
        
        bigPictureScrow.delegate = self
        bigPictureScrow.maximumZoomScale = 5
        bigPictureScrow.minimumZoomScale = 1

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return bigPictureImageView
    }
    @IBAction func shareButton(sender: AnyObject) {
        let activityVC: UIActivityViewController = UIActivityViewController(activityItems: [bigPictureImageView.image!, bigPictureNameLabel], applicationActivities: nil)
        self.presentViewController(activityVC, animated: true, completion: nil)
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
