//
//  ViewModel.swift
//  CustomControlTransitionDelegate
//
//  Created by Nattapong Unaregul on 7/8/17.
//  Copyright © 2017 Nattapong Unaregul. All rights reserved.
//

import UIKit



class ViewModel: NSObject {
    var selfChatter : Person?
    var otherChatter : Person?
    var chats = [Chat]()
    
    func fetchData(completion : @escaping (_ isDone : Bool) -> Void )  {
        selfChatter = Person(nickName: "Tyler")
        otherChatter = Person(nickName: "FlyEmUm")
        chats.append(Chat(message: "Hi", typeofChatter: .selfChatter))
        chats.append(Chat(message: "Hi", typeofChatter: .otherChatter))
        chats.append(Chat(message: "Nice to meet u", typeofChatter: .selfChatter))
        chats.append(Chat(message: "Nice to meet u too", typeofChatter: .otherChatter))
        chats.append(Chat(message: "...", typeofChatter: .selfChatter))
    }


}
