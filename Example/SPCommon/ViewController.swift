//
//  ViewController.swift
//  SPCommon
//
//  Created by panwh on 04/29/2019.
//  Copyright (c) 2019 panwh. All rights reserved.
//

import UIKit
import SPCommon

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        SPLog("test for one")
        print("r:\(SPSCREENW)")
//        SPCommon.spc
        SPSetLocalObject(NSNumber.init(value: 23), key: "key")
//        spCommon
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

