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
    var snapShotPresentationView : UIView?
    var isPresented = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.33
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        if let fromVc = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as? ViewController {
            let toVc = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! SecondViewController
            let translatedOriginPoint = image!.superview!.convert(image!.frame.origin, to: containerView)
            let snapshotView = image?.snapshotView(afterScreenUpdates: false)
            snapshotView?.frame.origin = translatedOriginPoint
            let targetOrigin = toVc.imageProfile.frame.origin
            let targetSize = toVc.imageProfile.frame.size
            self.image?.isHidden = true
            //            snapShotPresentationView = fromVc.view.resizableSnapshotView(from: fromVc.view.bounds, afterScreenUpdates: true, withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0 ))
            //            containerView.addSubview(snapShotPresentationView!)
            containerView.addSubview(snapshotView!)
            containerView.addSubview(toVc.view)
            toVc.view.isHidden = true
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                snapshotView?.frame.origin = targetOrigin
                snapshotView?.frame.size = targetSize
            }) { (isFinished) in
                toVc.view.isHidden = false
                snapshotView?.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }else {
            let fromVc = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! SecondViewController
            let toVc = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ViewController
            let snapshotView = fromVc.imageProfile.snapshotView(afterScreenUpdates: true)
            snapshotView?.frame.origin = fromVc.imageProfile.frame.origin
            containerView.addSubview(snapshotView!)
            let translatedOriginPoint = image!.superview!.convert(image!.frame.origin, to: containerView)
            let targetOrigin = translatedOriginPoint
            let targetSize = image!.frame.size
            fromVc.view.isHidden = true
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                snapshotView?.frame.origin = targetOrigin
                snapshotView?.frame.size = targetSize
                fromVc.view.alpha = 0.0
            }) { (isFinished) in
                self.image?.isHidden = false
                snapshotView?.removeFromSuperview()
                if transitionContext.transitionWasCancelled {
                    fromVc.view.alpha = 1.0
                    fromVc.view.isHidden = false
                }
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
    }
}


