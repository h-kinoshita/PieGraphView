//
//  _BackGroundView.swift
//  PieGraphView
//
//  Created by h.kinoshita on 2016/04/02.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

import UIKit

class _BackGroundView: UIView {
    var color: UIColor = UIColor.blueColor()
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clearColor();
    }
    
    func clear() {
        if let sublayers = self.layer.sublayers {
            for sublayer in sublayers {
                sublayer.removeFromSuperlayer()
            }
        }
    }
    
    func draw() {
        self.clear()
        let pi = CGFloat(M_PI)
        let start:CGFloat = 0.0 // 開始の角度
        let end :CGFloat = pi * 2.0 // 終了の角度
        
        var x:CGFloat = frame.origin.x;
        x += frame.size.width/2;
        var y:CGFloat = frame.origin.y;
        y += frame.size.height/2;
        let radius:CGFloat  = x;
        
        let path: UIBezierPath = UIBezierPath();
        path.moveToPoint(CGPointMake(x, y))
        path.addArcWithCenter(CGPointMake(x, y), radius: radius, startAngle: start, endAngle: end, clockwise: true) // 円弧
        
        let layer = CAShapeLayer()
        layer.fillColor = self.color.CGColor
        layer.path = path.CGPath
        self.layer.addSublayer(layer)
    }
}
