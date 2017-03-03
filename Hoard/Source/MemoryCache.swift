//
//  MemoryCache.swift
//  Hoard
//
//  Created by 郭朋 on 03/03/2017.
//  Copyright © 2017 Peng. All rights reserved.
//

import UIKit

class MemoryCache: Cache {
    
    public let cache = NSCache<AnyObject, AnyObject>()
    
    func store<T : Cachable>(key: String, object: T, completion: (() -> Void)?) {
        cache.setObject(object as AnyObject, forKey: key as AnyObject)
        completion?()
    }
    
    func retrieve<T : Cachable>(key: String, completion: @escaping (T?) -> Void) {
        let object = cache.object(forKey: key as AnyObject) //as? Capsule
        completion(object as? T)
    }
    
}
