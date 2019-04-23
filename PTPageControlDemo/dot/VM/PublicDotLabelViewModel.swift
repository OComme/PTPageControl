//
//  PublicDotLabelViewModel.swift
//  PTPageControlDemo
//
//  Created by 小虎 on 2019/4/23.
//  Copyright © 2019 OComme. All rights reserved.
//

import UIKit

class PublicDotLabelViewModel: NSObject {

}

extension PublicDotLabelViewModel: PTDotPageControlDatasource{
    func numberOfDot(in pageControl: PTDotPageControl) -> Int {
        return 5
    }
    
    func sizeOfDot(in pageControl: PTDotPageControl, index: Int) -> CGSize {
        return CGSize.init(width: 70, height: 30)
    }
    
    func dotView(in pageControl: PTDotPageControl, index: Int) -> UIView {
        let view = UIButton.init(type: .custom)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.setTitle("未选中", for: UIControl.State.normal)
        view.backgroundColor = UIColor.gray
        view.setTitleColor(UIColor.white, for: UIControl.State.normal)
        return view
    }
    
    func spaceOfDot(in pageControl: PTDotPageControl) -> CGFloat {
        return 5
    }
    
}

extension PublicDotLabelViewModel: PTDotPageControlDelegate{
    func dotViewDidSelected(in pageControl: PTDotPageControl, dotView: UIView, index: Int) {
        dotView.backgroundColor = UIColor.blue
        guard let btn = dotView as? UIButton else { return }
        btn.setTitle("选中", for: UIControl.State.normal)
    }
    
    func dotViewCancelSelect(in pageControl: PTDotPageControl, dotView: UIView, index: Int) {
        dotView.backgroundColor = UIColor.gray
        guard let btn = dotView as? UIButton else { return }
        btn.setTitle("未选中", for: UIControl.State.normal)
    }
}
