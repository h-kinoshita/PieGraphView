//
//  DemoBarViewController.swift
//  PieGraphView
//
//  Created by h.kinoshita on 2016/04/04.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

import UIKit

class DemoBarViewController: UIViewController {
    
    var barGraphView :BarGraphView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barGraphView = BarGraphView.init(frame: CGRectMake(60, 100, 100, 100),
                                         molecule: 40,
                                         denominator: 80,
                                         graphColor: UIColor.init(red: 0, green: 178, blue: 178, alpha: 1.0),
                                         backGroundColor: UIColor.init(red: 0, green: 128, blue: 128, alpha: 0.2),
                                         moleculeDisplayFlag: true
        )
        self.view.addSubview(barGraphView)
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startAnimation(sender: AnyObject) {
        
        barGraphView.graphAnimationStart()
    }
}
