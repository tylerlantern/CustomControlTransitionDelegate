//
//  MyTransition.swift
//  CustomControlTransitionDelegate
//
//  Created by Nattapong Unaregul on 7/9/17.
//  Copyright © 2017 Nattapong Unaregul. All rights reserved.
//

import UIKit

class AnimatedTransitionHandler: NSObject,UIViewControllerAnimatedTransitioning {
    var image : UIImageViewWithBorder?
    var isPresented = false
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.33
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        containerView.backgroundColor = UIColor.green
        if let fromVc = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as? ViewController {
            let toVc = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! SecondViewController
            let translatedOriginPoint = image!.superview!.convert(image!.frame.origin, to: containerView)
            let snapshotView = image?.snapshotView(afterScreenUpdates: false)
            snapshotView?.frame.origin = translatedOriginPoint
            let targetOrigin = toVc.imageProfile.frame.origin
            let targetSize = toVc.imageProfile.frame.size
            self.image?.isHidden = true
            
            containerView.addSubview(snapshotView!)
            //            toVc.view.isHidden = true
            print("Prepare Animating")
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                fromVc.collectionView.alpha = 0
                snapshotView?.frame.origin = targetOrigin
                snapshotView?.frame.size = targetSize
            }) { (isFinished) in
                toVc.view.isHidden = false
                containerView.addSubview(toVc.view)
                snapshotView?.removeFromSuperview()
                transitionContext.completeTransition(true)
            }
        }else {
            let fromVc = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! SecondViewController
            let toVc = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ViewController
            let snapshotView = fromVc.imageProfile.snapshotView(afterScreenUpdates: false)
            snapshotView?.frame.origin = fromVc.imageProfile.frame.origin
            containerView.addSubview(toVc.view)
            containerView.addSubview(snapshotView!)
            let translatedOriginPoint = image!.superview!.convert(image!.frame.origin, to: containerView)
            let targetOrigin = translatedOriginPoint
            let targetSize = image!.frame.size
            fromVc.imageProfile.isHidden = true
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                toVc.collectionView.alpha = 1
                snapshotView?.frame.origin = targetOrigin
                snapshotView?.frame.size = targetSize
            }) { (isFinished) in
                self.image?.isHidden = false
                snapshotView?.removeFromSuperview()
                transitionContext.completeTransition(true)
            }
        }
        
    }
}
