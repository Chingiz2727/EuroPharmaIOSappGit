//
//  Box.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/29/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
class Box<T> {
    typealias Listener = (T) -> ()
    
    var value : T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(listener:@escaping Listener) {
        self.listener = listener
        listener(value)
    }
    
    var listener : Listener?
    
    init(_ value:T) {
        self.value = value
    }
}
