//
//  InterfaceController.swift
//  watchtable WatchKit Extension
//
//  Created by John.zuo on 12/04/2015.
//  Copyright (c) 2015 John.zuo. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var tableShow: WKInterfaceTable!
    
    @IBOutlet weak var showText: WKInterfaceLabel!
    var dataArray = ["beef","sandwich","sushi"]
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    override func handleActionWithIdentifier(identifier: String?,
        forRemoteNotification remoteNotification: [NSObject : AnyObject]) {
            
            if let notificationIdentifier = identifier {
                
                if notificationIdentifier == "orderButtonAction" {
                    showText.setText("order succeed")
                    WKInterfaceController.openParentApplication(["type":"now"] ,reply:{(reply,error)->Void in
                        }
                    )
                }
                else if notificationIdentifier == "lookButtonAction" {
                    self.loadTable()
                }
            }
    }
    
    
    func loadTable(){
        tableShow.setNumberOfRows(dataArray.count, withRowType: "rowtype")
        
        for(index,context) in enumerate(dataArray){
            let row = tableShow.rowControllerAtIndex(index) as! rowController
            row.titleLable.setText(dataArray[index])
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        WKInterfaceController.openParentApplication(["type":dataArray[rowIndex]] ,reply:{(reply,error)->Void in
            }
        )
        
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
