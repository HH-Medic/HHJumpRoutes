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
    
    // push
    func SJPushViewController(current:UIViewController,moduleName:String,parameter:[String:String]?)
    
    /// 关闭当前控制器
    func SJDismissViewController()
    
    func SJPopViewController()
}

public extension SJJumpProtocol where Self : UIViewController
{
    public func SJPresentViewController(current:UIViewController,moduleName:String,parameter:[String:String]?)
    {
        SJJumpViewController(current, moduleName: moduleName, parameter: parameter, type: SJRegisterType.Present)
    }
    
    public func SJPushViewController(current:UIViewController,moduleName:String,parameter:[String:String]?)
    {
        SJJumpViewController(current, moduleName: moduleName, parameter: parameter, type: SJRegisterType.push)
    }
    
    // open URL
    func SJJumpViewController(current:UIViewController,moduleName:String,parameter:[String:String]?,type:SJRegisterType)
    {
        SJShareVCsAppend(current)
        
        var header = SJScheme() + "://" + type.rawValue + "/" + moduleName
        
        if let aPara = parameter
        {
            header += "/" + aPara.keys.first! + aPara.values.first!
        }
        
        let url = NSURL(string:header)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    
    
    public func SJDismissViewController()
    {
        SJShareVCsRemoveLast(SJType)
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    public func SJPopViewController()
    {
        SJShareVCsRemoveLast(SJType)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func moduleName() ->String
    {
        return NSStringFromClass(SJType).stringByReplacingOccurrencesOfString(".", withString: "/")
    }
}
