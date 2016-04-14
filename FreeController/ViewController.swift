//
//  ViewController.swift
//  FreeController
//
//  Created by shmily on 16/3/31.
//  Copyright © 2016年 shmily. All rights reserved.
//

import UIKit
import HHJumpRoutes


class ViewController: UIViewController,HHJumpProtocol {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.grayColor()
    }
    
    @IBAction func doJump2RedVC(sender: UIButton)
    {
        HHPresentViewController(self, moduleName: "FreeController/HHRedViewController?centerText=123")
    }
    
    var HHType: UIViewController.Type
    {
        return self.dynamicType
    }

}













