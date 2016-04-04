//
//  _BackGroundView.swift
//  PieGraphView
//
//  Created by h.kinoshita on 2016/04/02.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

import UIKit

class _BackGroundView: UIView {
    
    // MARK: - Required
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // MARK: - Initialize
    init(frame: CGRect, backGroundColor: UIColor ) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor();
        
        let pi = CGFloat(M_PI)
        let start:CGFloat = 0.0 // 開始の角度
        let end :CGFloat = pi * 2.0 // 終了の角度
        
        var x:CGFloat = frame.origin.x;
        x += frame.size.width/2;
        var y:CGFloat = frame.origin.y;
        y += frame.size.height/2;
        let radius:CGFloat  = x;
        
        let path: UIBezierPath = UIBezierPath();
        path.moveToPoint(CGPointMake(x, frame.size.height/2))
        path.addArcWithCenter(CGPointMake(x, frame.size.height/2), radius: radius, startAngle: start, endAngle: end, clockwise: true) // 円弧
        
        let layer = CAShapeLayer()
        layer.fillColor = backGroundColor.CGColor
        layer.path = path.CGPath
        self.layer.addSublayer(layer)
    }
}
