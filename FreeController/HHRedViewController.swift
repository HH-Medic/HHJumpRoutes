//
//  HHRedViewController.swift
//  FreeController
//
//  Created by shmily on 16/4/14.
//  Copyright © 2016年 shmily. All rights reserved.
//

import UIKit

class HHRedViewController: UIViewController
{
    var centerText:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blueColor()
        
        let aView = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 60))
        view.addSubview(aView)
        aView.text = centerText
    }

}
