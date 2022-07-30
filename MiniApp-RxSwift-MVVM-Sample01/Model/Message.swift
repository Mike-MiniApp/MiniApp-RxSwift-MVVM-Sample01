//
//  Message.swift
//  MiniApp-RxSwift-MVVM-Sample01
//
//  Created by 近藤米功 on 2022/07/30.
//

import UIKit

class Message{
    func getMessageValidEmail() -> String{
        return "emailは有効です"
    }

    func getMessageNoValidEmail() -> String{
        return "emailは無効です"
    }

    func getMessagePassword() -> String{
        return "パスワードは有効です"
    }

    func getMessageNoPassword() -> String{
        return "パスワードは無効です"
    }
}


