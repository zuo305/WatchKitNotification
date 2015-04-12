//
//  ViewController.swift
//  watchtable
//
//  Created by John.zuo on 12/04/2015.
//  Copyright (c) 2015 John.zuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private enum Color: String {
        case Red = "beef"
        case Green = "sandwich"
        case Orange = "sushi"
        case Blue = "blue"
        
        func color() -> UIColor {
            switch self {
            case Red:
                return UIColor.redColor()
            case .Green:
                return UIColor.greenColor()
            case .Orange:
                return UIColor.orangeColor()
            case .Blue:
                return UIColor.blueColor()
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: Selector("handleWatchKitNotification:"),
            name: "WatchKitSaysHello",
            object: nil)
        
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func handleWatchKitNotification(notification: NSNotification) {
        if let userInfo = notification.object as? [String : String] {
            if let colorStr = userInfo["type"] {
                let color = Color(rawValue: colorStr)
                var localNotification: UILocalNotification = UILocalNotification()
                localNotification.alertAction = "Testing notifications on iOS8"
                localNotification.alertBody = String(format: "order %@ succeed", colorStr)
                localNotification.fireDate = NSDate(timeIntervalSinceNow: 1)
                UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
                
                view.backgroundColor = color?.color()
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

