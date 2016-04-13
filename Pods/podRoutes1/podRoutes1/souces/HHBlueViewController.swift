//
//  HHBlueViewController.swift
//  podRoutes1
//
//  Created by shmily on 16/3/30.
//  Copyright © 2016年 shmily. All rights reserved.
//

import UIKit
import SJFreeController

public class HHBlueViewController: UIViewController,SJJumpProtocol {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blueColor()
        
        let aLabel = UILabel(frame: CGRect.init(x: 50, y: 70, width: 350, height: 30))
        aLabel.text = "第二个模块"
        view.addSubview(aLabel)
        
        addBtn("关闭", action: #selector(HHBlueViewController.dismissViewController), x: 200)
    }
    
    
    func dismissViewController()
    {
        SJDismissViewController()
    }
    
    // 添加按钮
    func addBtn(name:String,action:Selector,x:CGFloat)
    {
        let aBtn = UIButton(frame: CGRect.init(x: x, y: 300, width: 150, height: 45))
        aBtn.backgroundColor = UIColor.whiteColor()
        aBtn.addTarget(self, action: action, forControlEvents: .TouchUpInside)
        aBtn.setTitle(name, forState: .Normal)
        aBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
        view.addSubview(aBtn)
    }
    
    deinit
    {
        print("HHBlueViewController dismiss")
    }
    
    public var SJType: UIViewController.Type
    {
        return self.dynamicType
    }
    
}
