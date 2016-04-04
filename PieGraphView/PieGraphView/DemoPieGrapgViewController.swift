//
//  DemoPieGrapfViewController.swift
//  PieGraphView
//
//  Created by h.kinoshita on 2016/04/02.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

import UIKit

class DemoPieGraphViewController: UIViewController {

    var graphView:PieGraphView!;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let molecule: Float = 40.0;
        let denominator: Float = 100.0;
        let graphColor: UIColor = UIColor.yellowColor()
        let backGroundColor: UIColor = UIColor.darkGrayColor()
        graphView = PieGraphView(frame: CGRectMake(0, 30, 100, 100), molecule: molecule, denominator:denominator ,graphColor: graphColor, backGroundColor: backGroundColor)
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
        let moleculeCange: Float = 85.0;
        let denominatorChange: Float = 100.0;
        let graphColorChange: UIColor = UIColor.yellowColor()
        graphView.changeParams(moleculeCange, denominator: denominatorChange, graphColor: graphColorChange)
        graphView.startAnimating()
    }
    
}

