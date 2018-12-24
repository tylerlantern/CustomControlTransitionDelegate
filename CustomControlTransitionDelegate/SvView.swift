//
//  SvView.swift
//  CustomControlTransitionDelegate
//
//  Created by Nattapong Unaregul on 8/21/17.
//  Copyright © 2017 Nattapong Unaregul. All rights reserved.
//

import UIKit
@IBDesignable
class SvView: UIView {
    
    
    @IBOutlet weak var imageProfile: UIImageViewWithBorder!
    
    lazy var maskLayer : CAShapeLayer = {
        let l = CAShapeLayer()
        return l ;
    }()
    lazy var maskPath : UIBezierPath = {
        let p = UIBezierPath()
        return p ;
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInitilization()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInitilization()
    }
    func sharedInitilization()  {
        maskLayer.fillColor = UIColor.white.cgColor
//                self.layer.insertSublayer(maskLayer, at: 0)
//        maskLayer.fillRule = kCAFillRuleEvenOdd
        self.layer.mask = maskLayer
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.bounds != maskLayer.frame {
            guard let imv = self.subviews.first(where: { (view) -> Bool in
                view.isKind(of: UIImageViewWithBorder.self)
            }) else {
                return
            }
            let centerImv = imv.center
            let radius = imv.frame.width / 2
            maskLayer.frame = self.bounds
            let originPoint = CGPoint(x: 0, y: imv.frame.origin.y +  imv.bounds.height / 2 )
            maskPath.move(to: originPoint)
            maskPath.addLine(to: CGPoint(x: imv.frame.origin.x, y: imv.frame.origin.y +  imv.bounds.height / 2))
            maskPath.addArc(withCenter: centerImv, radius: radius, startAngle: CGFloat.pi, endAngle: 0, clockwise: true)
            maskPath.addLine(to: CGPoint(x: self.bounds.width, y: imv.frame.origin.y +  imv.bounds.height / 2))
            maskPath.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
            maskPath.addLine(to: CGPoint(x: 0, y: self.bounds.height))
            maskPath.close()
//            maskLayer.strokeColor = UIColor.blue.cgColor
//            maskLayer.lineWidth = 4
            
            maskLayer.path = maskPath.cgPath
        }
    }
    
}
