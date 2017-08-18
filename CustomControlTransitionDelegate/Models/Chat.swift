//
//  Chat.swift
//  CustomControlTransitionDelegate
//
//  Created by Nattapong Unaregul on 7/8/17.
//  Copyright © 2017 Nattapong Unaregul. All rights reserved.
//

import UIKit


enum TypeofChatter : Int {
    case selfChatter = 0 ,
    otherChatter
}
class Chat: NSObject {
    var message : String!
    var typeofChatter : TypeofChatter!
    init(message : String , typeofChatter : TypeofChatter) {
        self.message = message
        self.typeofChatter = typeofChatter
    }
}
