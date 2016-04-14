//
//  SJStackViewController.swift
//  FreeController
//
//  Created by shmily on 16/3/31.
//  Copyright © 2016年 shmily. All rights reserved.
//

import UIKit

public class SJStackViewController {
    
    public static let shareInstance = SJStackViewController()
    
    private init(){}
    
    public var viewControllers = [UIViewController]()
    
    public var rootScheme:String?
    
}

public enum SJRegisterType:String
{
    case Present = "/present"
    case push = "/push"
}


public func SJAddScheme(scheme:String)
{
    SJStackViewController.shareInstance.rootScheme = scheme
}


public func SJScheme() ->String
{
    return SJStackViewController.shareInstance.rootScheme!
}

/// 保存的控制器堆栈
public func SJShareViewController() -> UIViewController
{
    return SJStackViewController.shareInstance.viewControllers.last!
}

public func SJShareVCsAppend(appendVC:UIViewController)
{
    SJStackViewController.shareInstance.viewControllers.append(appendVC)
}

public func SJShareVCsRemoveLast(type:UIViewController.Type)
{
    if  type == SJShareViewController().dynamicType
    {
        SJStackViewController.shareInstance.viewControllers.removeLast()
    }
    
}