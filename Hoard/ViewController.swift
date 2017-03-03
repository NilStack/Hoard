//
//  ViewController.swift
//  Hoard
//
//  Created by 郭朋 on 03/03/2017.
//  Copyright © 2017 Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView()
        imageView.frame = view.bounds
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        let imageURL = URL(string: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png")!
        let image = try! UIImage(data: Data(contentsOf: imageURL))
        
        let cache = Hoard.sharedCache
        cache.store(key: "image", object: image!, completion: nil)
        cache.retrieve(key: "image") { (image: UIImage?) in
            if let image = image {
                imageView.image = image
            } else {
                print("no image")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

