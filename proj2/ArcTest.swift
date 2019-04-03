//
//  ArcTest.swift
//  proj1
//
//  Created by sakamotoyuya on 2019/03/31.
//  Copyright © 2019 sakamotoyuya. All rights reserved.
//

import UIKit

class ArcTest: NSObject {
    var a: A? = A()
    var b: B? = B()
    /// コンストラクタ
    override init(){
        super.init()
        a!.b = b
        b!.a = a
    }
    deinit { print("ArcTestを解放しました") }
}

class A {
    var b: B?
    func call(){
        print("A call")
    }
    deinit { print("Aを解放しました") }
}

class B {
    weak var a: A?
    func call(){
        print("B call")
    }
    deinit { print("Bを解放しました") }
}
