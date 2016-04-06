//
//  BarGraphView.swift
//  PieGraphView
//
//  Created by h.kinoshita on 2016/04/05.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

import UIKit

class BarGraphView: UIView {
    
    // MARK: - Global Vars
    var _frameY: CGFloat!
    var _frameWidth: CGFloat!
    var _frameHeight: CGFloat!
    var _animateFrameY: CGFloat!
    var _ratio: CGFloat!
    var _graphHeight: CGFloat!
    var _graphColor: UIColor!
    var _backGroundColor: UIColor!
    var _molecule: Float!
    
    // MARK: - Classes
    var backGroundView: UIView!
    var graphView: UIView!
    var countingLabel: CountingLabel!
    
    // MARK: - Required
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // MARK: - Initialize
    init(frame: CGRect, molecule: Float, denominator: Float, graphColor: UIColor, backGroundColor: UIColor ) {
        super.init(frame: frame)
        
        _frameY = frame.minY
        _frameWidth  = frame.width
        _frameHeight  = frame.height
        _animateFrameY = (_frameY + _frameHeight) / 2
        _ratio = CGFloat(molecule / denominator)
        _graphHeight = _frameHeight * _ratio
        _graphColor = graphColor
        _backGroundColor = backGroundColor
        _molecule = molecule
        
        settingBackGroundView()
        settingCountingLabel()
    }
    
    func settingBackGroundView() {
        backGroundView = UIView()
        backGroundView.frame = CGRectMake(0, 0, _frameWidth, _frameHeight)
        backGroundView.backgroundColor = _backGroundColor
        backGroundView.layer.cornerRadius = backGroundView.frame.width / 2
        backGroundView.clipsToBounds = true
        self.addSubview(backGroundView)
    }
    
    func graphAnimationStart () {
        graphView = UIView()
        graphView.backgroundColor = _graphColor
        graphView.frame = CGRectMake(0, _animateFrameY, _frameWidth, 0)
        backGroundView.addSubview(graphView)
        countForAnimationType(_molecule)
        
        UIView.animateWithDuration(0.6, delay: 0, options: [UIViewAnimationOptions.CurveEaseInOut],                        animations: { () -> Void in
            self.graphView.frame = CGRectMake(0, self._animateFrameY - self._graphHeight, self._frameWidth, self._graphHeight)
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
