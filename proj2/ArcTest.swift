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
//    var b: B? = B()
    var b:B?
    
    /// コンストラクタ
    override init(){
        super.init()
        b = B(obj: a!)
        a!.b = b
//        b!.a = a
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
    /*
     weak(弱参照)でなくunowned(非所有参照)にして確認する。
     */
    //weak var a: A?
    //unowned var a: A?
    
    /**
     ただ変えるだけだとエラーとなった。
     'unowned' may only be applied to class and class-bound protocol types, not 'A?'
     →unownedはクラスとクラス拡張プロトコルタイプでのみ適用される。A?ではだめ。
     →非所有参照は、weakと異なり、nilを値として設定できないためOptional宣言ができない。
     */
    unowned var a:A
    
    ///コンストラクタ
    ///
    /// - Parameter obj: Aのオブジェクト
    init(obj:A){
        a = obj
    }

    func call(){
        print("B call")
    }
    deinit { print("Bを解放しました") }
}
