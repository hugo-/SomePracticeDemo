//
//  TestViewController.swift
//  SwiftPracticeDemo
//
//  Created by hugo on 15-8-15.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    var _count = "打印全局变量"
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "test"
        // Do any additional setup after loading the view.
    }
    @IBAction func goOC(sender: AnyObject) {
        println("进入OC and  \(_count)")
       var oc =  OCViewController()
        self.navigationController?.pushViewController(oc, animated: true)
    }
    
    @IBAction func goTableView(sender: AnyObject) {
        var tableView : TableViewController
        tableView = TableViewController(nibName: "TableViewController",bundle:nil);
        self.navigationController?.pushViewController(tableView, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
