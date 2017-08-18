//
//  PersonModel.swift
//  CustomControlTransitionDelegate
//
//  Created by Nattapong Unaregul on 7/8/17.
//  Copyright © 2017 Nattapong Unaregul. All rights reserved.
//

import UIKit



class Person: NSObject {
    var firstName : String?
    var lastName : String?
    var nickName : String?
    var profilePicture : UIImage?
    var type : TypeofChatter = .selfChatter

    init(nickName : String) {
        self.nickName = nickName
    }
    
}
