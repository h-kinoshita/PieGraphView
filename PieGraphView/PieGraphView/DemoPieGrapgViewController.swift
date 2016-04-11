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
        graphView = PieGraphView(frame: CGRectMake(100, 100, 100, 100))
        graphView._molecule = 0;
        graphView._denominator = 0;
        graphView._graphColor = UIColor.init(red: 0, green: 178, blue: 178, alpha: 1.0)
        graphView._backGroundColor = UIColor.init(red: 0, green: 128, blue: 128, alpha: 0.2)
        graphView._moleculeDisplayFlag = false
        graphView.displayAnimated = true
        graphView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(graphView)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func start(sender: AnyObject) {
        graphView._molecule = 30
        graphView._denominator = 30
        graphView.draw()
    }
    
    @IBAction func change(sender: AnyObject) {
        graphView.clear()
    }
    
}

