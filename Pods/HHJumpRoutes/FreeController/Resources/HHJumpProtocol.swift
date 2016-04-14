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
    func HHPresentViewController(current:UIViewController,moduleName:String,parameter:[String:String]?)
    
    // push
    func HHPushViewController(current:UIViewController,moduleName:String,parameter:[String:String]?)
    
    /// 关闭当前控制器
//    func HHDismissViewController()
    
//    func HHPopViewController()
}

public extension HHJumpProtocol where Self : UIViewController
{
    public func HHPresentViewController(current:UIViewController,moduleName:String,parameter:[String:String]?)
    {
        HHJumpViewController(current, moduleName: moduleName, parameter: parameter, type: HHRegisterType.Present)
    }
    
    public func HHPushViewController(current:UIViewController,moduleName:String,parameter:[String:String]?)
    {
        HHJumpViewController(current, moduleName: moduleName, parameter: parameter, type: HHRegisterType.push)
    }
    
    // open URL
    func HHJumpViewController(current:UIViewController,moduleName:String,parameter:[String:String]?,type:HHRegisterType)
    {
        var header = HHScheme() + "://" + type.rawValue + "/" + moduleName
        
        if let aPara = parameter
        {
            header += "/" + aPara.keys.first! + aPara.values.first!
        }
        
        let url = NSURL(string:header)!
        UIApplication.sharedApplication().openURL(url)
    }

    
//    public func HHPopViewController()
//    {
//        self.navigationController?.popViewControllerAnimated(true)
//    }
    
    func moduleName() ->String
    {
        return NSStringFromClass(HHType).stringByReplacingOccurrencesOfString(".", withString: "/")
    }
}
