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
    var _molecule: Float = 0.0 {
        didSet {
            self.updateEndAngle()
        }
    }
    var _denominator: Float = 0.0 {
        didSet {
            self.updateEndAngle()
        }
    }
    var _graphColor: UIColor = UIColor.redColor()
    
    // MARK: - private vars
    private var _end_angle: CGFloat = 0.0
    
    var displayAnimated: Bool = false
    
    // MARK: - Required
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.backgroundColor = UIColor.clearColor()
    }
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    // MARK: - Internal Func
    func changeParams(molecule: Float, denominator: Float, graphColor: UIColor){
        _molecule = molecule
        _denominator = denominator
        _graphColor = graphColor
        
        _end_angle = CGFloat(_molecule / _denominator) * CGFloat(M_PI)
    }
    private func updateEndAngle() {
        _end_angle = CGFloat(_molecule / _denominator) * CGFloat(M_PI)
    }
    func clear() {
        if let sublayers = self.layer.sublayers {
            for sublayer in sublayers {
                sublayer.removeFromSuperlayer()
            }
        }
    }
    
    func draw(){
        self.clear()
    
        var x:CGFloat = self.frame.origin.x
        x += self.frame.size.width/2
        var y:CGFloat = self.frame.origin.y
        y += self.frame.size.height/2
        
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
        
        if !self.displayAnimated {
            return
        }
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
