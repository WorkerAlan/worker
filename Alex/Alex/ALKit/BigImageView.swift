//
//  BigImageView.swift
//  Alex
//
//  Created by Alan on 2020/11/12.
//

import UIKit
import ImageIO
import CoreImage
import QuartzCore

class BigImageView: UIView {
    
    override class var layerClass: AnyClass {
        return CATiledLayer.self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        (self.layer as! CATiledLayer).tileSize = CGSize(width: width/5, height: 50)
    }
    
    override func draw(_ rect: CGRect) {
        let scale = width/height
        let imageCutRect = CGRect(x: rect.x/scale, y: rect.y/scale, width: rect.width/scale, height: rect.height/scale)
        
        
//        CGRect imageCutRect = CGRectMake(rect.origin.x / imageScale,rect.origin.y / imageScale,rect.size.width / imageScale,rect.size.height / imageScale);
//            //截取指定图片区域，重绘
//
//            CGImageRef imageRef = CGImageCreateWithImageInRect(originImage.CGImage, imageCutRect);
        
//            UIImage *tileImage = [UIImage imageWithCGImage:imageRef];
//            CGContextRef context = UIGraphicsGetCurrentContext();
//            UIGraphicsPushContext(context);
//            [tileImage drawInRect:rect];
//            UIGraphicsPopContext();
    }
    
}
