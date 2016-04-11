//
//  PieGraphView.swift
//  PieGraphView
//
//  Created by h.kinoshita on 2016/04/02.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

import UIKit

@IBDesignable class PieGraphView: UIView {
    
    // MARK: - Grobal vars
    /// Parameter
    @IBInspectable var _molecule: Float = 0.0 {
        didSet {
            self.makePieGraphView._molecule = self._molecule
        }
    }
    @IBInspectable var _denominator: Float = 0.0 {
        didSet {
            self.makePieGraphView._denominator = self._denominator
        }
    }
    @IBInspectable var _graphColor: UIColor {
        get {
            return self.makePieGraphView._graphColor
        }
        set(value) {
            self.makePieGraphView._graphColor = value
        }
    }
    @IBInspectable var _backGroundColor: UIColor {
        get {
            return self.backGroundView.color
        }
        set(value) {
            self.backGroundView.color = value
        }
    }
    @IBInspectable var _moleculeDisplayFlag: Bool = false {
        didSet {
            makeMoleculeView.hidden = !_moleculeDisplayFlag
        }
    }
    var displayAnimated: Bool = false {
        didSet {
            self.makePieGraphView.displayAnimated = self.displayAnimated
        }
    }
    
    /// Classes
    var makePieGraphView = _MakePieGraphView(frame: CGRectZero)
    var backGroundView = _BackGroundView(frame: CGRectZero)
    var makeMoleculeView = _MakeMoleculeView(frame: CGRectZero)
    
    // MARK: - Required
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor();
        self.setSubView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layoutSubviews")
        backGroundView.frame = self.bounds
        makePieGraphView.frame = self.bounds
        makeMoleculeView.frame = self.bounds
        self.draw()
    }
    
    // MARK: Private func
    func setSubView() {
        self.addSubview(backGroundView)
        self.addSubview(makePieGraphView)
        self.addSubview(makeMoleculeView)
    }
    
    // MARK: - Internal func
    func draw() {
        self.backGroundView.draw()
        self.makePieGraphView.draw()
        if self.displayAnimated {
            self.makeMoleculeView.countForAnimationType(self._molecule)
        } else {
            self.makeMoleculeView.showEndValue()
        }
    }
    
    func clear() {
        print("clear")
        self.makePieGraphView.clear()
        self.makeMoleculeView.showStartValue()
    }
}
