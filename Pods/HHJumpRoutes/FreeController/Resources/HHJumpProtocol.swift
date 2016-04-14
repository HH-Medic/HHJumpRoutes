//
//  HHJumpProtocol.swift
//  FreeController
//
//  Created by shmily on 16/3/31.
//  Copyright © 2016年 shmily. All rights reserved.
//

import UIKit

public protocol HHJumpProtocol
{
    /// presnet 控制器的type
    var HHType:UIViewController.Type{get}
    
    /// modal控制器
    /// - parameter current:    当前用于跳转的控制器
    /// - parameter moduleName: 需要跳转的module + 控制器名称
    /// - parameter parameter:  传参
    func HHPresentViewController(current:UIViewController,moduleName:String)
    
    // push
    func HHPushViewController(current:UIViewController,moduleName:String)
    
}

public extension HHJumpProtocol where Self : UIViewController
{
    public func HHPresentViewController(current:UIViewController,moduleName:String)
    {
        HHJumpViewController(current, moduleName: moduleName, type: HHRegisterType.Present)
    }
    
    public func HHPushViewController(current:UIViewController,moduleName:String)
    {
        HHJumpViewController(current, moduleName: moduleName, type: HHRegisterType.push)
    }
    
    // open URL
    func HHJumpViewController(current:UIViewController,moduleName:String,type:HHRegisterType)
    {
        HHShareAddController(current) // 保存
        let url = NSURL(string:HHScheme() + "://" + type.rawValue + "/" + moduleName)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    func moduleName() ->String
    {
        return NSStringFromClass(HHType).stringByReplacingOccurrencesOfString(".", withString: "/")
    }
}
