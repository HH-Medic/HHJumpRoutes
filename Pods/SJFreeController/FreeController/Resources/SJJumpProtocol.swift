//
//  SJJumpProtocol.swift
//  FreeController
//
//  Created by shmily on 16/3/31.
//  Copyright © 2016年 shmily. All rights reserved.
//

import UIKit

public protocol SJJumpProtocol
{
    /// presnet 控制器的type
    var SJType:UIViewController.Type{get}
    
    /// modal控制器
    /// - parameter current:    当前用于跳转的控制器
    /// - parameter moduleName: 需要跳转的module + 控制器名称
    /// - parameter parameter:  传参
    func SJPresentViewController(current:UIViewController,moduleName:String,parameter:[String:String]?)
    
    /// 关闭当前控制器
    func SJDismissViewController()
}

public extension SJJumpProtocol where Self : UIViewController
{
    public func SJPresentViewController(current:UIViewController,moduleName:String,parameter:[String:String]?)
    {
        SJShareVCsAppend(current)
        
        let url = NSURL(string:SJScheme() + "/" + moduleName)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    public func SJDismissViewController()
    {
        SJShareVCsRemoveLast(SJType)
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func moduleName() ->String
    {
        return NSStringFromClass(SJType).stringByReplacingOccurrencesOfString(".", withString: "/")
    }
}
