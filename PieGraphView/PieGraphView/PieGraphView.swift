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
    var _params:[Dictionary<String,AnyObject>]!
    var _backGroundColor: UIColor!
    
    /// Classes
    var makePieGraphView: _makePieGraphView!
    var backGroundView: _backGroundView!
    
    // MARK: - Required
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // MARK: - Initialize
    init(frame: CGRect, params:[Dictionary<String, AnyObject>], backGroundColor: UIColor) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor();
        _params = params;
        _backGroundColor = backGroundColor
        self.setSubView()
        
    }
    
    // MARK: Private func
    func setSubView() {
        // addSubView customView of BackGround
        backGroundView = _backGroundView.init(frame: frame, backGroundColor: _backGroundColor)
        makePieGraphView = _makePieGraphView.init(frame: frame, params: _params)
        
        self.addSubview(backGroundView)
        self.addSubview(makePieGraphView)
    }
    
    // MARK: - Internal func
    func changeParams(params:[Dictionary<String,AnyObject>]){
        self.makePieGraphView.changeParams(params)
    }
    
    func startAnimating(){
        self.makePieGraphView.startAnimating()
        
    }

}
