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
    var makePieGraphView: _MakePieGraphView!
    var backGroundView: _BackGroundView!
    var makeMoleculeView: _MakeMoleculeView!
    
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
        backGroundView = _BackGroundView.init(frame: frame, backGroundColor: _backGroundColor)
        makePieGraphView = _MakePieGraphView.init(frame: frame, molecule: _molecule, denominator: _denominator, graphColor: _graphColor)
        makeMoleculeView = _MakeMoleculeView.init(frame: frame, molecule: _molecule)
        
        self.addSubview(backGroundView)
        self.addSubview(makePieGraphView)
        self.addSubview(makeMoleculeView)
    }
    
    // MARK: - Internal func
    func changeParams(molecule: Float, denominator: Float, graphColor: UIColor){
        _molecule = molecule
        self.makePieGraphView.changeParams(molecule, denominator: denominator, graphColor: graphColor)
    }
    
    func startAnimating(){
        self.makePieGraphView.startAnimating()
        self.makeMoleculeView.countForAnimationType(_molecule)
        
    }

}
