//
//  HHRedViewController.swift
//  podRoutes2
//
//  Created by shmily on 16/3/30.
//  Copyright © 2016年 shmily. All rights reserved.
//

import UIKit
import SJFreeController

class HHRedViewController: UIViewController,SJJumpProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.redColor()
        
        addBtn("跳转控制器", action: #selector(HHRedViewController.jumpToBlue), x: 20)
        
        addBtn("关闭", action: #selector(HHRedViewController.dismissViewController), x: 200)
    }
    
    func jumpToBlue()
    {
        SJPresentViewController(self, moduleName: "podRoutes1/HHBlueViewController", parameter: nil)
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
        print("delete HHRedViewController")
    }

    
    var SJType: UIViewController.Type
    {
        return self.dynamicType
    }
    
}

//extension HHRedViewController:SJJumpProtocol
//{
//    
//}

