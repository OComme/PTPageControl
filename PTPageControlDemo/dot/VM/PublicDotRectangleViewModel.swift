//
//  PublicDotRectangleViewModel.swift
//  PTPageControlDemo
//
//  Created by 小虎 on 2019/4/22.
//  Copyright © 2019 OComme. All rights reserved.
//

import UIKit

class PublicDotRectangleViewModel: NSObject {

}


extension PublicDotRectangleViewModel: PTDotPageControlDatasource{
    func dotViewWillSelect(in pageControl: PTDotPageControl, dotView: UIView, index: Int) {
        dotView.backgroundColor = UIColor.blue
    }
    
    func dotViewWillCancelSelect(in pageControl: PTDotPageControl, dotView: UIView, index: Int) {
        dotView.backgroundColor = UIColor.red
    }
    
    func numberOfDot(in pageControl: PTDotPageControl) -> Int {
        return 5
    }
    
    func sizeOfDot(in pageControl: PTDotPageControl, index: Int) -> CGSize {
        return CGSize.init(width: 40, height: 5)
    }
    
    func dotView(in pageControl: PTDotPageControl, index: Int) -> UIView {
        let view = UIControl.init()
        view.backgroundColor = UIColor.red
        return view
    }
    
    func spaceOfDot(in pageControl: PTDotPageControl) -> CGFloat {
        return 5
    }
    
}
