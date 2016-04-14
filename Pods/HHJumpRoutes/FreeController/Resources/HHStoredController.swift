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
    
    public weak var viewController:UIViewController?
    
    public var rootScheme:String?
    
}

public enum HHRegisterType:String
{
    case Present = "present"
    case push = "push"
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
public func HHShareViewController() -> UIViewController?
{
    return HHStoredController.shareInstance.viewController
}

public func HHShareAddController(controller:UIViewController)
{
    HHStoredController.shareInstance.viewController = controller
}

public func HHShareDefault()
{
    HHStoredController.shareInstance.viewController = nil
}