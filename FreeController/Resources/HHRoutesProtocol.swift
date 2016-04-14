//
//  HHRoutesProtocol.swift
//  FreeController
//
//  Created by shmily on 16/4/1.
//  Copyright © 2016年 shmily. All rights reserved.
//

import UIKit
import HHJLRoutes

public protocol HHRoutesProtocol {
    
    func HHRegistPresent()
    func HHRegisterPush()
    
}


public extension HHRoutesProtocol
{
    public func HHRegistPresent()
    {
        JLRoutes.addRoute("\(HHRegisterType.Present.rawValue)/:to/:toVC") {
            if let aVC = HHShareViewController()
            {
                aVC.presentViewController(self.createViewController($0), animated: true, completion: nil)
            }
            return true
        }
    }
    
    public func HHRegisterPush()
    {
        JLRoutes.addRoute("\(HHRegisterType.push.rawValue)/:to/:toVC") {
            if let aVC = HHShareViewController()
            {
                aVC.navigationController?.pushViewController(self.createViewController($0), animated: true)
            }
            return true
        }
    }
    
    func createViewController(parameter: NSDictionary) -> UIViewController
    {
        let name = String(parameter["to"]!) + "." + String(parameter["toVC"]!)
        
        let mClass = NSClassFromString(name) as! UIViewController.Type
        let aVC = mClass.init()
        
        if let value = parameter["kJLRoutesParameter"]
        {
            for para in value as! [[String:AnyObject]]
            {
                aVC.setValue(para[para.keys.first!], forKey: para.keys.first!)
            }
            
        }
        
        return aVC
    }
    
}

/// 获取参数
func getParaVaule(parameter: [NSObject: AnyObject],key:String) -> String?
{
    return parameter[key] as? String
}