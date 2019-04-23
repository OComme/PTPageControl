//
//  PublicDotImageViewModel.swift
//  PTPageControlDemo
//
//  Created by 小虎 on 2019/4/23.
//  Copyright © 2019 OComme. All rights reserved.
//

import UIKit

class PublicDotImageViewModel: NSObject {

}

extension PublicDotImageViewModel: PTDotPageControlDatasource{
    func numberOfDot(in pageControl: PTDotPageControl) -> Int {
        return 5
    }
    
    func sizeOfDot(in pageControl: PTDotPageControl, index: Int) -> CGSize {
        return CGSize.init(width: 40, height: 40)
    }
    
    func dotView(in pageControl: PTDotPageControl, index: Int) -> UIView {
        let view = UIImageView.init()
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor.red
        return view
    }
    
    func spaceOfDot(in pageControl: PTDotPageControl) -> CGFloat {
        return 5
    }
    
}

extension PublicDotImageViewModel: PTDotPageControlDelegate{
    func dotViewDidSelected(in pageControl: PTDotPageControl, dotView: UIView, index: Int) {
        guard let imageView = dotView as? UIImageView else { return }
        imageView.image = UIImage.init(named: "ios-marketing")
    }
    
    func dotViewCancelSelect(in pageControl: PTDotPageControl, dotView: UIView, index: Int) {
        guard let imageView = dotView as? UIImageView else { return }
        imageView.image = nil
    }
}
