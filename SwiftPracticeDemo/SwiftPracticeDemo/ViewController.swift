//
//  ViewController.swift
//  SwiftPracticeDemo
//
//  Created by hugo on 15-8-15.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title="Swift"
        
        var btn=UIButton()
        btn.frame=CGRectMake(10,100,300, 50)
        btn.backgroundColor=UIColor.blackColor()
        btn .setTitle("SWIFT", forState: UIControlState.Normal)
        btn .addTarget(self, action:"goTest", forControlEvents:UIControlEvents.TouchDown)
        self.view .addSubview(btn)
    }
    
    func goTest(){
        var test = TestViewController(nibName: "TestViewController", bundle: nil);
        self.navigationController?.pushViewController(test, animated:true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

