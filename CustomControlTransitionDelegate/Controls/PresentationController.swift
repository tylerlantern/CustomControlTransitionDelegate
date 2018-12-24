//
//  PresentationController.swift
//  CustomControlTransitionDelegate
//
//  Created by Nattapong Unaregul on 9/25/17.
//  Copyright © 2017 Nattapong Unaregul. All rights reserved.
//

import UIKit
protocol PresentationHandlerDelegate {
    func presentationBegin(scdVc : SecondViewController)
}
class PresentationHandler: UIPresentationController {
    
    var delegateScd : PresentationHandlerDelegate?
    fileprivate var dimmingView: ParticalView!
    
    override var shouldRemovePresentersView: Bool {
        return false
    }
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        setupDimmingView()
    }
    
    func setupDimmingView() {
        dimmingView = ParticalView()
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        dimmingView.alpha = 0.0
    }
    
    override func presentationTransitionWillBegin() {
        dimmingView.frame = presentingViewController.view.bounds
        containerView?.addSubview(dimmingView)
        let scdVc = presentedViewController as! SecondViewController
        delegateScd?.presentationBegin(scdVc: scdVc)
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 1.0
            return
        }
        coordinator.animate(alongsideTransition: { (context) in
            self.dimmingView.alpha = 1.0
        }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 0.0
            return
        }
        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.0
        })
    }
    
}
