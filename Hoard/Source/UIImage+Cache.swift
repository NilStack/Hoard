//
//  UIImage+Cache.swift
//  Hoard
//
//  Created by 郭朋 on 03/03/2017.
//  Copyright © 2017 Peng. All rights reserved.
//

import UIKit

extension UIImage: Cachable {
    public typealias CacheType = UIImage
    
    public static func decode(_ data: Data) -> CacheType? {
        let image = UIImage(data: data)
        return image
    }
    
    public func encode() -> Data? {
        return hasAlpha
            ? UIImagePNGRepresentation(self)
            : UIImageJPEGRepresentation(self, 1.0)
    }
}

// MARK: - Helpers

extension UIImage {

    var hasAlpha: Bool {
        let result: Bool
        
        guard let alpha = cgImage?.alphaInfo else { return false }
        
        switch alpha {
        case .none, .noneSkipFirst, .noneSkipLast:
            result = false
        default:
            result = true
        }
        
        return result
    }
}
