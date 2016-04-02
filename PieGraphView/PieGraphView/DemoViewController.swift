//
//  DemoViewController.swift
//  PieGraphView
//
//  Created by h.kinoshita on 2016/04/02.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    var graphView:PieGraphView!;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let molecule: Float = 40.0;
        let denominate: Float = 100.0;
        let graphColor: UIColor = UIColor.blueColor()
        let backGroundColor: UIColor = UIColor.darkGrayColor()
        graphView = PieGraphView(frame: CGRectMake(0, 30, 320, 320), molecule: molecule, denominator:denominate ,graphColor: graphColor, backGroundColor: backGroundColor)
        self.view.addSubview(graphView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func start(sender: AnyObject) {
        graphView.startAnimating()
    }
    
    @IBAction func change(sender: AnyObject) {
        let randInt:Int = 1
        let colorList:[UIColor] = [UIColor.redColor(),
                                   UIColor.blueColor(),
                                   UIColor.yellowColor(),
                                   UIColor.greenColor(),
                                   UIColor.grayColor()]
        var params = [Dictionary<String,AnyObject>]()
        for i in 0 ..< randInt {
            let param:Int = 5;
            params.append(["value":param,"color":colorList[i]])
        }
        graphView.changeParams(params)
        graphView.startAnimating()
    }
    
}

