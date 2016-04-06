//
//  HorizontalBarView.swift
//  PieGraphView
//
//  Created by h.kinoshita on 2016/04/06.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

import UIKit

class HorizontalBarView: UIView {

    // MARK: - Global Vars
    var _frameX: CGFloat!
    var _frameWidth: CGFloat!
    var _frameHeight: CGFloat!
    var _animateFrameX: CGFloat!
    var _ratio: CGFloat!
    var _graphWidth: CGFloat!
    var _graphColor: UIColor!
    var _backGroundColor: UIColor!
    var _molecule: Float!
    var _moleculeDisplayFlag: Bool!
    
    // MARK: - Classes
    var backGroundView: UIView!
    var graphView: UIView!
    var countingLabel: CountingLabel!
    
    
    // MARK: - Required
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // MARK: - Initialize
    init(frame: CGRect, molecule: Float, denominator: Float, graphColor: UIColor, backGroundColor: UIColor, moleculeDisplayFlag: Bool ) {
        super.init(frame: frame)
        
        _frameX = frame.minX
        _frameWidth  = frame.width
        _frameHeight  = frame.height
        _animateFrameX = _frameX + _frameWidth
        _ratio = CGFloat(molecule / denominator)
        _graphWidth = -_frameWidth * _ratio
        _graphColor = graphColor
        _backGroundColor = backGroundColor
        _molecule = molecule
        _moleculeDisplayFlag = moleculeDisplayFlag
        
        settingBackGroundView()
        
        if _moleculeDisplayFlag! {
            settingCountingLabel()
        }
    }
    
    func settingBackGroundView() {
        backGroundView = UIView()
        backGroundView.frame = CGRectMake(0, 0, _frameWidth, _frameHeight)
        backGroundView.backgroundColor = _backGroundColor
        backGroundView.clipsToBounds = true
        self.addSubview(backGroundView)
    }
    
    func graphAnimationStart () {
        graphView = UIView()
        graphView.backgroundColor = _graphColor
        graphView.frame = CGRectMake(0, 0, 0, _frameHeight)
        backGroundView.addSubview(graphView)
        
        if _moleculeDisplayFlag! {
            countForAnimationType(_molecule)
        }
        
        UIView.animateWithDuration(0.6, delay: 0, options: [UIViewAnimationOptions.CurveEaseInOut],                        animations: { () -> Void in
            self.graphView.frame = CGRectMake(0, 0, -self._graphWidth + self._frameX, self._frameHeight)
            return }, completion: nil)
    }
    
    func countForAnimationType(toValue: Float) {
        countingLabel.countFrom(0, to: toValue, withDuration: NSTimeInterval(0.6), andAnimationType: .EaseOut, andCountingType: .Int)
    }
    
    func settingCountingLabel() {
        countingLabel = CountingLabel()
        countingLabel.frame = CGRectMake(0, 0, _frameWidth, _frameHeight)
        countingLabel.text = String(0)
        countingLabel.font = UIFont.boldSystemFontOfSize(20)
        countingLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(countingLabel)
    }
}
