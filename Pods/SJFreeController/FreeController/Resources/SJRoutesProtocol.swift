//
//  SJRoutesProtocol.swift
//  FreeController
//
//  Created by shmily on 16/4/1.
//  Copyright © 2016年 shmily. All rights reserved.
//

import UIKit
import JLRoutes

public protocol SJRoutesProtocol {
    
    func SJAddPresentRoutes(header:String)
    
    
//    func SJAddDismissRoutes(header:String)
}


public extension SJRoutesProtocol
{
    public func SJAddPresentRoutes(header:String)
    {
        JLRoutes.addRoute("/\(header)/:to/:toVC") {
            
            SJShareViewControllers().presentViewController(self.createViewController($0), animated: true, completion: nil)

            return true
        }
    }
    
//    func SJAddDismissRoutes(header:String)
//    {
//        JLRoutes.addRoute("/\(header)/:dismiss/:dismissVC") {
//            
//            SJShareViewControllers().presentViewController(self.createViewController($0), animated: true, completion: nil)
//            
//            return true
//        }
//    }
    
    
    func createViewController(parameter: [NSObject: AnyObject]) -> UIViewController
    {
        let name = (parameter["to"]! as! String) + "." + (parameter["toVC"]! as! String)
        
        let mClass = NSClassFromString(name) as! UIViewController.Type
        
        return mClass.init()
    }

}