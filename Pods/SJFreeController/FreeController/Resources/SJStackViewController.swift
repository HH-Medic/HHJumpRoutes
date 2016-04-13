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
    
    public var schemePresnet:String?
}

public func SJUpdateScheme(schemePresent:String)
{
    SJStackViewController.shareInstance.schemePresnet = schemePresent
}

public func SJScheme() ->String
{
    
    return SJStackViewController.shareInstance.schemePresnet!
}

/// 保存的控制器堆栈
public func SJShareViewControllers() -> UIViewController
{
    return SJStackViewController.shareInstance.viewControllers.last!
}

public func SJShareVCsAppend(appendVC:UIViewController)
{
    SJStackViewController.shareInstance.viewControllers.append(appendVC)
}

public func SJShareVCsRemoveLast(type:UIViewController.Type)
{
    if  type == SJShareViewControllers().dynamicType
    {
        SJStackViewController.shareInstance.viewControllers.removeLast()
    }
    
}