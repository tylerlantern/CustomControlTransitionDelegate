//
//  ParticalView.swift
//  CustomControlTransitionDelegate
//
//  Created by Nattapong Unaregul on 9/25/17.
//  Copyright © 2017 Nattapong Unaregul. All rights reserved.
//

import UIKit

class ParticalView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        let rect = CGRect(x: 0.0, y: -70.0, width: self.bounds.width, height: 50.0)
        let emitter = CAEmitterLayer()
        emitter.frame = rect
        layer.addSublayer(emitter)
        
        emitter.emitterShape = kCAEmitterLayerRectangle
        emitter.emitterPosition = CGPoint(x: rect.width/2, y: rect.height/2)
        emitter.emitterSize = rect.size
        
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage(named: "flake.png")?.cgImage
        
        emitterCell.birthRate = 20
        emitterCell.lifetime = 3.5
        emitter.emitterCells = [emitterCell]
        emitterCell.yAcceleration = 70.0
        emitterCell.xAcceleration = 10.0
        emitterCell.velocity = 20.0
        emitterCell.emissionLongitude = .pi * -0.5
        emitterCell.velocityRange = 200.0
        emitterCell.emissionRange = .pi * 0.5
        emitterCell.color = UIColor(red: 0.9, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        emitterCell.redRange   = 0.3
        emitterCell.greenRange = 0.3
        emitterCell.blueRange  = 0.3
        emitterCell.redRange   = 0.1
        emitterCell.greenRange = 0.1
        emitterCell.blueRange  = 0.1
        emitterCell.scale = 0.8
        emitterCell.scaleRange = 0.8
        emitterCell.scaleSpeed = -0.15
        emitterCell.birthRate = 150
        emitterCell.alphaRange = 0.75
        emitterCell.alphaSpeed = -0.15
        emitterCell.emissionLongitude = -.pi
        emitterCell.lifetimeRange = 1.0
        
        //cell #2
        let cell2 = CAEmitterCell()
        cell2.contents = UIImage(named: "flake2.png")?.cgImage
        cell2.birthRate = 50
        cell2.lifetime = 2.5
        cell2.lifetimeRange = 1.0
        cell2.yAcceleration = 50
        cell2.xAcceleration = 50
        cell2.velocity = 80
        cell2.emissionLongitude = .pi
        cell2.velocityRange = 20
        cell2.emissionRange = .pi * 0.25
        cell2.scale = 0.8
        cell2.scaleRange = 0.2
        cell2.scaleSpeed = -0.1
        cell2.alphaRange = 0.35
        cell2.alphaSpeed = -0.15
        cell2.spin = .pi
        cell2.spinRange = .pi
        
        //cell #3
        let cell3 = CAEmitterCell()
        cell3.contents = UIImage(named: "flake3.png")?.cgImage
        cell3.birthRate = 20
        cell3.lifetime = 7.5
        cell3.lifetimeRange = 1.0
        cell3.yAcceleration = 20
        cell3.xAcceleration = 10
        cell3.velocity = 40
        cell3.emissionLongitude = .pi
        cell3.velocityRange = 50
        cell3.emissionRange = .pi * 0.25
        cell3.scale = 0.8
        cell3.scaleRange = 0.2
        cell3.scaleSpeed = -0.05
        cell3.alphaRange = 0.5
        cell3.alphaSpeed = -0.05
        
        emitter.emitterCells = [emitterCell, cell2, cell3]
    }
}
