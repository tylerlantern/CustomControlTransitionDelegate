//
//  InteractionTransitionHandler.swift
//  CustomControlTransitionDelegate
//
//  Created by Nattapong Unaregul on 9/24/17.
//  Copyright © 2017 Nattapong Unaregul. All rights reserved.
//

import UIKit

class InteractionTransitionHandler:  UIPercentDrivenInteractiveTransition {
    var transitionInProgress = false
    var shouldCompleteTransition = false
    var viewController : UIViewController!
    var imageToHandleGesture : UIImageViewWithBorder? {
        didSet{
            if imageToHandleGesture != nil {
                imageToHandleGesture?.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gestureRecognizer:)) ))
            }
        }
    }
    func attachViewController(_ vc : UIViewController)  {
        viewController = vc
        //        vc.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gestureRecognizer:)) ))
    }
    var const :  CGFloat = 0
    func handlePanGesture(gestureRecognizer: UIPanGestureRecognizer) {
        let threshold : CGFloat = 200
        let viewTranslation = gestureRecognizer.translation(in: gestureRecognizer.view!.superview?.superview)
        switch gestureRecognizer.state {
        case .began:
            transitionInProgress = true
            viewController.dismiss(animated: true, completion: nil)
            break
        case .changed:
            const = CGFloat(fminf(fmaxf(Float(viewTranslation.y / threshold), 0.01), 0.99))
            shouldCompleteTransition = const > 0.5
            update(const)
            break
        case .cancelled, .ended , .failed:
            if !shouldCompleteTransition || gestureRecognizer.state == .cancelled {
                cancel()
            } else {
                finish()
            }
            transitionInProgress = false
            break
        default:
            print("Swift switch must be exhaustive, thus the default")
            transitionInProgress = false
            break
        }
    }
    
}
