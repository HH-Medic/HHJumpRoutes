//
//  HHStoredController.swift
//  FreeController
//
//  Created by shmily on 16/3/31.
//  Copyright © 2016年 shmily. All rights reserved.
//

import UIKit

public class HHStoredController {
    
    public static let shareInstance = HHStoredController()
    
    private init(){}
    
    public var viewControllers = [UIViewController]()
    
    public var rootScheme:String?
    
}

public enum HHRegisterType:String
{
    case Present = "/present"
    case push = "/push"
}


public func HHAddScheme(scheme:String)
{
    HHStoredController.shareInstance.rootScheme = scheme
}


public func HHScheme() ->String
{
    return HHStoredController.shareInstance.rootScheme!
}

/// 保存的控制器堆栈
public func HHShareViewController() -> UIViewController
{
    return HHStoredController.shareInstance.viewControllers.last!
}

public func HHShareVCsAppend(appendVC:UIViewController)
{
    HHStoredController.shareInstance.viewControllers.append(appendVC)
}

public func HHShareVCsRemoveLast(type:UIViewController.Type)
{
    if  type == HHShareViewController().dynamicType
    {
        HHStoredController.shareInstance.viewControllers.removeLast()
    }
    
}