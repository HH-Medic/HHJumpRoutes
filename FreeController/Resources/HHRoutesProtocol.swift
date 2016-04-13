//
//  HHRoutesProtocol.swift
//  FreeController
//
//  Created by shmily on 16/4/1.
//  Copyright © 2016年 shmily. All rights reserved.
//

import UIKit
import JLRoutes

public protocol HHRoutesProtocol {
    
    func HHRegistPresent()
    func HHRegisterPush()
    
}


public extension HHRoutesProtocol
{
    public func HHRegistPresent()
    {
        JLRoutes.addRoute("/\(HHRegisterType.Present.rawValue)/:to/:toVC/:key/:value") {
            
            HHShareViewController().presentViewController(self.createViewController($0), animated: true, completion: nil)
            return true
        }
    }
    
    public func HHRegisterPush()
    {
        JLRoutes.addRoute("/\(HHRegisterType.push.rawValue)/:to/:toVC/:key/:value") {
            
            HHShareViewController().navigationController?.pushViewController(self.createViewController($0), animated: true)
            return true
        }
    }
    
    func createViewController(parameter: [NSObject: AnyObject]) -> UIViewController
    {
        let name = getParaVaule(parameter, key: "to")! + "." + getParaVaule(parameter, key: "toVC")!
        
        let mClass = NSClassFromString(name) as! UIViewController.Type
        
        let aVC = mClass.init()
        
        if let aKey = getParaVaule(parameter, key: "key")
        {
            aVC.setValue(getParaVaule(parameter, key: "value")!, forKey: aKey)
        }
        return aVC
    }
    
}

/// 获取参数
func getParaVaule(parameter: [NSObject: AnyObject],key:String) -> String?
{
    return parameter[key] as? String
}