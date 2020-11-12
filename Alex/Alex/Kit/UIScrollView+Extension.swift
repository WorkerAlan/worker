//
//  UIScrollView+Extension.swift
//  Alex
//
//  Created by Alan on 2020/11/12.
//

import UIKit

//extension UIScrollView {
//    func snapScrollView(imageBlock: ((UIImage) -> Void)?) {
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
//            let offset = self.contentOffset
//            let origialFrame = self.frame
//            self.contentOffset = CGPoint.zero
//            if self.contentSize.width == 0 {
//                self.size = CGSize(width: AppInfo.width, height: self.contentSize.height)
//            } else {
//                self.size = self.contentSize
//            }
//            let image = self.snapView()
//            self.frame = origialFrame
//            self.contentOffset = offset
//            if let block = imageBlock {
//                block(image)
//            }
//        }
//    }
//}
