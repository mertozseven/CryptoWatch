//
//  UIHelper.swift
//  Crypto Watch
//
//  Created by Mert Ozseven on 2.05.2024.
//

import UIKit

struct UIHelper {
    
    static func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let newImage = renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
        
        return newImage
    }
    
}
