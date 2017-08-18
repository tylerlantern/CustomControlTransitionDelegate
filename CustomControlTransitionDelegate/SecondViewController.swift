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
    @IBAction func actionDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var imageProfile: UIImageViewWithBorder!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("scd:\(#function)")
        imageProfile.image = imageData
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("scd:\(#function)")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("scd:\(#function)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

