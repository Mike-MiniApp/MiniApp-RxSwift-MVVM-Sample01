//
//  Extension-String.swift
//  MiniApp-RxSwift-MVVM-Sample01
//
//  Created by 近藤米功 on 2022/07/30.
//

import UIKit

extension String{
    var isValidEmail: Bool{
        self.contains("@gmail.com")
    }

    var isValidPassword: Bool{
        self.count >= 4
    }
}
