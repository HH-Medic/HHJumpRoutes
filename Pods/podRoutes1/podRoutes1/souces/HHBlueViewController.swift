//
//  HHBlueViewController.swift
//  podRoutes1
//
//  Created by shmily on 16/3/30.
//  Copyright © 2016年 shmily. All rights reserved.
//

import UIKit
import HHJumpRoutes

public class HHBlueViewController: UIViewController,HHJumpProtocol {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blueColor()
        
        addBtn("关闭", action: #selector(HHBlueViewController.dismissViewController), x: 200)
    }
    
    
    func dismissViewController()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
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
    
    public var HHType: UIViewController.Type
    {
        return self.dynamicType
    }
    
}
