//
//  Cachable.swift
//  Hoard
//
//  Created by 郭朋 on 03/03/2017.
//  Copyright © 2017 Peng. All rights reserved.
//

import UIKit

public protocol Cachable {
    associatedtype CacheType
    
    static func decode(_ data: Data) -> CacheType?
    
    func encode() -> Data?
}

