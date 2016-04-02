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
    
    // MARK: - Required
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // MARK: - Initialize
    init(frame: CGRect, molecule: Float, denominator: Float, graphColor: UIColor) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        
        _end_angle = -CGFloat(M_PI / 2.0)
        _molecule = molecule
        _denominator = denominator
        _graphColor = graphColor
        
    }
    
    // MARK: - Private Func
    func update(link:AnyObject){
        var flag = true
        let angle = CGFloat(M_PI*2.0 / 100.0)
        _end_angle = _end_angle +  angle
        if(_end_angle > CGFloat(M_PI*2)) {
            // end prosess
            link.invalidate()
        } else {
            self.setNeedsDisplay()
            if flag {
                let transition = CATransition()
                transition.duration = 1.0
                transition.delegate = self
                transition.removedOnCompletion = false
                transition.fillMode = kCAFillModeForwards
                transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
                self.layer.addAnimation(transition, forKey: nil)
                flag = false
            }
        }
    }
    
    // MARK: - Internal Func
    func changeParams(molecule: Float, denominator: Float, graphColor: UIColor){
        _molecule = molecule
        _denominator = denominator
        _graphColor = graphColor
    }
    
    func startAnimating(){
        _end_angle = -CGFloat(M_PI / 2.0)
        let displayLink = CADisplayLink(target: self, selector: #selector(_MakePieGraphView.update(_:)))
        displayLink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
    }
    
    // MARK: - Overrides
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        self.drawingRextLayer(rect, context: context)

    }
    
    func drawingRextLayer(rect: CGRect, context: CGContext) {
        var x:CGFloat = rect.origin.x
        x += rect.size.width/2
        var y:CGFloat = rect.origin.y
        y += rect.size.height/2
        let max:CGFloat = CGFloat(_denominator)
        
        var start_angle:CGFloat = -CGFloat(M_PI / 2)
        var end_angle:CGFloat    = 0
        let radius:CGFloat  = x - 10.0
        let value = CGFloat(_molecule)
        end_angle = start_angle + CGFloat(M_PI*2) * (value/max)
        if(end_angle > _end_angle) {
            end_angle = _end_angle
        }
        let color:UIColor = _graphColor
        
        let bodyLayer = CAShapeLayer()
        bodyLayer.fillColor = color.CGColor
        
        let bodyPath = UIBezierPath()
        bodyPath.moveToPoint(CGPoint(x: rect.size.width/2, y: rect.size.height/2))
        bodyPath.addArcWithCenter(CGPoint(x:rect.size.width/2, y: rect.size.height/2), radius: radius/2, startAngle: start_angle, endAngle: end_angle, clockwise: true)
        bodyPath.closePath()
        bodyLayer.path = bodyPath.CGPath
        layer.addSublayer(bodyLayer)
        
        start_angle = end_angle
    }
    
}