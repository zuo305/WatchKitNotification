//
//  InterfaceController.swift
//  no WatchKit Extension
//
//  Created by John.zuo on 12/04/2015.
//  Copyright (c) 2015 John.zuo. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var resultText: WKInterfaceLabel!
    override func handleActionWithIdentifier(identifier: String?, forRemoteNotification remoteNotification: [NSObject : AnyObject]) {
        
        if let notificationIdentifier = identifier {
            if notificationIdentifier == "firstButtonAction"{
                resultText.setText("Order successful!")
                WKInterfaceController.openParentApplication(["color":"green"] ,reply:{(reply,error)->Void in
                    
                    }
                )
            }
        }
    }
    

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
