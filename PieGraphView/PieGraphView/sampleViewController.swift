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
     
        let pi = CGFloat(M_PI)
        let start:CGFloat = -CGFloat(pi / 2) // 開始の角度
        let end :CGFloat = pi * 2.0 // 終了の角度
        

        
        // 円のCALayer作成
        let ovalShapeLayer = CAShapeLayer()
        let path: UIBezierPath = UIBezierPath();
        path.addArcWithCenter(CGPointMake(self.view.frame.width/2, self.view.frame.height/2), radius: self.view.frame.width/8, startAngle: start, endAngle: end, clockwise: true) // 円弧
        ovalShapeLayer.strokeColor = UIColor.blueColor().CGColor  // 輪郭は青色
        ovalShapeLayer.fillColor = UIColor.clearColor().CGColor
        ovalShapeLayer.lineWidth = self.view.frame.width/4  // 輪郭の線の太さは1.0pt
        ovalShapeLayer.path = path.CGPath
        
        // 作成したCALayerを画面に追加
        view.layer.addSublayer(ovalShapeLayer)
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.removedOnCompletion = false
        strokeEndAnimation.fillMode  = kCAFillModeForwards
        strokeEndAnimation.fromValue = 0.0
        strokeEndAnimation.toValue   = 1.0
        strokeEndAnimation.duration  = 2.0
        strokeEndAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        ovalShapeLayer.addAnimation(strokeEndAnimation, forKey: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
