//
//  TransitionManager.swift
//  CustomControlTransitionDelegate
//
//  Created by Nattapong Unaregul on 9/25/17.
//  Copyright © 2017 Nattapong Unaregul. All rights reserved.
//

import Foundation
import UIKit

class TransitionManager: NSObject {
    lazy var interactionTransitionHandler = InteractionTransitionHandler()
    lazy var animatedTransitionHandler = AnimatedTransitionHandler()
    var presentationHandler : PresentationHandler?
    var image :  UIImageViewWithBorder? {
        didSet {
            animatedTransitionHandler.image = image
        }
    }
}
extension TransitionManager : PresentationHandlerDelegate {
    func presentationBegin(scdVc: SecondViewController) {
        interactionTransitionHandler.imageToHandleGesture = scdVc.imageProfile
    }
}
extension TransitionManager : UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animatedTransitionHandler
    }
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animatedTransitionHandler
    }
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionTransitionHandler.transitionInProgress ?  interactionTransitionHandler : nil
    }
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        presentationHandler = PresentationHandler(presentedViewController: presented, presenting: presenting)
        interactionTransitionHandler.attachViewController(presented)
        presentationHandler?.delegateScd = self
        return presentationHandler
    }
}
