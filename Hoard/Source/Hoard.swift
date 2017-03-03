//
//  Hoard.swift
//  Hoard
//
//  Created by 郭朋 on 03/03/2017.
//  Copyright © 2017 Peng. All rights reserved.
//

import UIKit

class Hoard: Cache {
    
    static let sharedCache = Hoard()
    
    let memoryCache = MemoryCache()
    let diskCache = DiskCache()
    
    public func store<T : Cachable>(key: String, object: T, completion: (() -> Void)?) {
        memoryCache.store(key: key, object: object) {
            
            self.diskCache.store(key: key, object: object, completion: {
                completion?()
            })
            
        }
    }
    
    public func retrieve<T : Cachable>(key: String, completion: @escaping (T?) -> Void) {
        memoryCache.retrieve(key: key) { (object: T?) in
            if let object = object {
                completion(object)
                return
            }
            
            self.diskCache.retrieve(key: key, completion: { (object: T?) in
                if let object = object {
                    self.memoryCache.store(key: key, object: object, completion: nil)
                    completion(object)
                }
            })
            
        }
    }
    
}
