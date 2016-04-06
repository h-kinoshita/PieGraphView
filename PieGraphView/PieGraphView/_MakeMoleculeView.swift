//
//  _MakeMoleculeView.swift
//  PieGraphView
//
//  Created by h.kinoshita on 2016/04/04.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

import UIKit

class _MakeMoleculeView: UIView {
    // MARK: - Classes
    var countingLabel: CountingLabel!
    
    // MARK: - Required
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        
        countingLabel = CountingLabel()
        
        settingCountingLabel(frame)
    }
    
    func countForAnimationType(toValue: Float) {
        countingLabel.countFrom(0, to: toValue, withDuration: NSTimeInterval(0.6), andAnimationType: .EaseOut, andCountingType: .Int)
    }
    
    func settingCountingLabel(frame: CGRect) {
        countingLabel.frame = frame
        countingLabel.text = String(0)
        countingLabel.font = UIFont.boldSystemFontOfSize(20)
        countingLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(countingLabel)
    }
}
