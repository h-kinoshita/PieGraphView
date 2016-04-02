//
//  PieGraphView.swift
//  PieGraphView
//
//  Created by h.kinoshita on 2016/04/02.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    
    // MARK: - Grobal vars
    /// Parameter
    var _molecule: Float!
    var _denominator: Float!
    var _graphColor: UIColor!
    var _backGroundColor: UIColor!
    
    /// Classes
    var makePieGraphView: _makePieGraphView!
    var backGroundView: _backGroundView!
    
    // MARK: - Required
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // MARK: - Initialize
    init(frame: CGRect, molecule: Float, denominator: Float, graphColor: UIColor, backGroundColor: UIColor) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor();
        _molecule = molecule
        _denominator = denominator
        _graphColor = graphColor
        _backGroundColor = backGroundColor
        self.setSubView()
        
    }
    
    // MARK: Private func
    func setSubView() {
        // addSubView customView of BackGround
        backGroundView = _backGroundView.init(frame: frame, backGroundColor: _backGroundColor)
        makePieGraphView = _makePieGraphView.init(frame: frame, molecule: _molecule, denominator: _denominator, graphColor: _graphColor)
        
        self.addSubview(backGroundView)
        self.addSubview(makePieGraphView)
    }
    
    // MARK: - Internal func
    func changeParams(params:[Dictionary<String,AnyObject>]){
        self.makePieGraphView.changeParams(_molecule, denominator: _denominator, graphColor: _graphColor)
    }
    
    func startAnimating(){
        self.makePieGraphView.startAnimating()
        
    }

}
