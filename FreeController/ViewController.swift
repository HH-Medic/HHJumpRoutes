//
//  ViewController.swift
//  FreeController
//
//  Created by shmily on 16/3/31.
//  Copyright © 2016年 shmily. All rights reserved.
//

import UIKit
import SJFreeController


class ViewController: UIViewController,SJJumpProtocol {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.grayColor()
    }
    
    @IBAction func doJump2RedVC(sender: UIButton)
    {
        SJPresentViewController(self,moduleName: "podRoutes2/HHRedViewController",parameter: nil)
    }
    
    var SJType: UIViewController.Type
    {
        return self.dynamicType
    }

}













