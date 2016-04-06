//
//  DemoHorizontalBarViewController.swift
//  PieGraphView
//
//  Created by h.kinoshita on 2016/04/06.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

import UIKit

class DemoHorizontalBarViewController: UIViewController {

    var horizonatalBarView: HorizontalBarView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        horizonatalBarView = HorizontalBarView.init(frame: CGRectMake(20, 100, 200, 20),
                                         molecule: 100,
                                         denominator: 100,
                                         graphColor: UIColor.init(red: 0, green: 178, blue: 178, alpha: 1.0),
                                         backGroundColor: UIColor.init(red: 0, green: 128, blue: 128, alpha: 0.2),
                                         moleculeDisplayFlag: true
        )
        self.view.addSubview(horizonatalBarView)
        
        horizonatalBarView.graphAnimationStart()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
}
