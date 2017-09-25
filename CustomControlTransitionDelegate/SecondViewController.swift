//
//  SecondViewController.swift
//  CustomControlTransitionDelegate
//
//  Created by Nattapong Unaregul on 7/9/17.
//  Copyright © 2017 Nattapong Unaregul. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var imageData : UIImage?
    
    @IBOutlet var svView: SvView!
    
    @IBAction func actionDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var imageProfile: UIImageViewWithBorder!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageProfile.image = imageData
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

