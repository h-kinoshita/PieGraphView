//
//  sampleViewController.swift
//  PieGraphView
//
//  Created by h.kinoshita on 2016/04/04.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

import UIKit

class sampleViewController: UIViewController {
    
    var valueLabel: CountingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueLabel = CountingLabel()
        valueLabel.frame = CGRectMake(70, 70, 100, 100)
        valueLabel.backgroundColor = UIColor.blueColor()
        self.view.addSubview(valueLabel)
        
    }
    
    func countForAnimationType(type: CountingLabel.AnimationType) {
        valueLabel.countFrom(0, to: 349, withDuration: NSTimeInterval(6), andAnimationType: type, andCountingType: .Int)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func update(sender: AnyObject) {
        countForAnimationType(.EaseOut)
    }
    

}
