//
//  UIImageViewWithBorder.swift
//  CustomControlTransitionDelegate
//
//  Created by Nattapong Unaregul on 7/7/17.
//  Copyright © 2017 Nattapong Unaregul. All rights reserved.
//

import UIKit
@IBDesignable
class UIImageViewWithBorder: UIImageView ,NSCopying{
    override func awakeFromNib() {
        super.awakeFromNib()
        sharedInitialization()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        sharedInitialization()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInitialization()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        sharedInitialization()
    }
    func sharedInitialization() {
        self.layer.masksToBounds = true
    }
    func copy(with zone: NSZone? = nil) -> Any {
        let data = NSKeyedArchiver.archivedData(withRootObject: self)
        let imageView = NSKeyedUnarchiver.unarchiveObject(with: data) as! UIImageViewWithBorder
        return imageView
    }
    
    
}
extension UIImageViewWithBorder {
    @IBInspectable
    var cornerRadius: CGFloat? {
        get {
            return self.layer.cornerRadius
        }
        set(newValue) {
            self.layer.cornerRadius = newValue ?? 15
        }
    }
    
}
