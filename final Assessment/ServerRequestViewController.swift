//
//  ServerRequestViewController.swift
//  final Assessment
//
//  Created by Kyle on 8/4/16.
//  Copyright © 2016 Alphacamp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ServerRequestViewController: UIViewController {
    
    @IBOutlet weak var originValue: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    let date = NSDate()
    let dateFormatter = NSDateFormatter()
    var day:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        day = dateFormatter.stringFromDate(date)
        print(day)
        
        let urlString = "https://httpbin.org/get"
        Alamofire.request(.GET, urlString).responseJSON {
            response in
            
            if let data = response.result.value{
                let json = JSON(data)
                self.originValue.text = "\(json["origin"])"
                print(json["origin"])
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postButton(sender: AnyObject) {
        let time = ["time": day]
        let urlString = "https://httpbin.org/post"
        
        Alamofire.request(.POST, urlString, parameters: time).responseJSON { response in
            
            if response.result.value != nil{
                let date2 = NSDate()
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let backtime = dateFormatter.stringFromDate(date2)
                print(backtime)
                
                let calendar = NSCalendar.currentCalendar()
                let dateComponet = calendar.components([.Second], fromDate: self.date)
                let date2Componet = calendar.components([.Second], fromDate: date2)
                
                let dateSecond = Double(dateComponet.second)
                let date2Second = Double(date2Componet.second)
                
                if date2Second - dateSecond < 0{
                    print(date2Second + (60 - dateSecond))
                    self.timeLabel.text = "相差:\(date2Second + (60 - dateSecond))秒"
                }else{
                    print(date2Second - dateSecond)
                    self.timeLabel.text = "相差:\(date2Second - dateSecond)秒"
                }
                
              
            }
            
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
