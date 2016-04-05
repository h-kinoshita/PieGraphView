//
//  _makePieGraphView.swift
//  PieGraphView
//
//  Created by h.kinoshita on 2016/04/02.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

import UIKit

class _MakePieGraphView: UIView {
    
    // MARK: - Grobal vars
    var _end_angle: CGFloat!
    var _molecule: Float!
    var _denominator: Float!
    var _graphColor: UIColor!
    var _frame: CGRect!
    
    // MARK: - Required
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // MARK: - Initialize
    init(frame: CGRect, molecule: Float, denominator: Float, graphColor: UIColor) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        
        _molecule = molecule
        _denominator = denominator
        _graphColor = graphColor
        _frame = frame
        _end_angle = CGFloat(_molecule / _denominator) * CGFloat(M_PI)
        
    }
    
    // MARK: - Internal Func
    func changeParams(molecule: Float, denominator: Float, graphColor: UIColor){
        _molecule = molecule
        _denominator = denominator
        _graphColor = graphColor
        
        _end_angle = CGFloat(_molecule / _denominator) * CGFloat(M_PI)
    }
    
    func startAnimating(){
        var x:CGFloat = _frame.origin.x
        x += _frame.size.width/2
        var y:CGFloat = _frame.origin.y
        y += _frame.size.height/2
        
        // 円のCALayer作成
        let ovalShapeLayer = CAShapeLayer()
        let path: UIBezierPath = UIBezierPath();
        let startAngle:CGFloat = -CGFloat(M_PI / 2)
        let endAngle:CGFloat    = _end_angle

        path.addArcWithCenter(CGPointMake(x, y),
                              radius: x/2,
                              startAngle: startAngle,
                              endAngle: endAngle,
                              clockwise: true)
        ovalShapeLayer.strokeColor = _graphColor.CGColor
        ovalShapeLayer.fillColor = UIColor.clearColor().CGColor
        ovalShapeLayer.lineWidth = x
        ovalShapeLayer.path = path.CGPath
        
        // 作成したCALayerを画面に追加
        self.layer.addSublayer(ovalShapeLayer)
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.removedOnCompletion = false
        strokeEndAnimation.fillMode  = kCAFillModeForwards
        strokeEndAnimation.fromValue = 0.0
        strokeEndAnimation.toValue   = 1.0
        strokeEndAnimation.duration  = 0.6
        strokeEndAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        ovalShapeLayer.addAnimation(strokeEndAnimation, forKey: nil)
    }
}
