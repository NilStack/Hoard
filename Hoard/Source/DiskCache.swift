//
//  DiskCache.swift
//  Hoard
//
//  Created by 郭朋 on 03/03/2017.
//  Copyright © 2017 Peng. All rights reserved.
//

import UIKit

class DiskCache: Cache {
    
    public let path: String = {
        let dstPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        return (dstPath as NSString).appendingPathComponent("DiskCache")
    }()

    fileprivate let fileManager = FileManager()
    fileprivate let ioQueue: DispatchQueue = DispatchQueue(label: "DiskCacheIOQueue")
    
    func store<T : Cachable>(key: String, object: T, completion: (() -> Void)?) {
        ioQueue.async {
            
            if !self.fileManager.fileExists(atPath: self.path) {
                do {
                    try self.fileManager.createDirectory(atPath: self.path, withIntermediateDirectories: true, attributes: nil)
                } catch _ {}
            }
            
            let cacheFilePath = (self.path as NSString).appendingPathComponent(key)
            
            self.fileManager.createFile(atPath: cacheFilePath, contents: object.encode(), attributes: nil)
            
        }
        
        completion?()
    }
    
    func retrieve<T : Cachable>(key: String, completion: @escaping (T?) -> Void) {
        let filePath = (self.path as NSString).appendingPathComponent(key)
        let object = try? Data(contentsOf: URL(fileURLWithPath: filePath))
        completion(object as? T)
    }
    
}
