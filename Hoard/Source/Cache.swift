//
//  Cache.swift
//  Hoard
//
//  Created by 郭朋 on 03/03/2017.
//  Copyright © 2017 Peng. All rights reserved.
//

import UIKit

public protocol Cache {

    func store<T: Cachable>(key: String, object: T, completion: (() -> Void)?)
    
    func retrieve<T: Cachable>(key: String, completion: @escaping (_ object: T?) -> Void)
    
}
