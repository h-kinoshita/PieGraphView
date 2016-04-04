//
//  _MakeMoleculeView.swift
//  PieGraphView
//
//  Created by h.kinoshita on 2016/04/04.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

import UIKit

class _MakeMoleculeView: UIView {

    // MARK: - Global Var
    var _molecule: Float!
    var _frame: CGRect!
    
    // MARK: - Classes
    var countingLabel: CountingLabel!
    
    // MARK: - Required
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // MARK: - Initialize
    init(frame: CGRect, molecule: Float) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        
        _molecule = molecule
        _frame = frame
        countingLabel = CountingLabel()
        
        settingCountingLabel()
    }
    
    func countForAnimationType(toValue: Float) {
        countingLabel.countFrom(0, to: toValue, withDuration: NSTimeInterval(0.5), andAnimationType: .EaseOut, andCountingType: .Int)
    }
    
    func settingCountingLabel() {
        countingLabel.frame = _frame
        countingLabel.text = String(0)
        countingLabel.font = UIFont.boldSystemFontOfSize(20)
        countingLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(countingLabel)
    }
}
