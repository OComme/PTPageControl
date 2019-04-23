
//
//  PublicSlipPointViewModel.swift
//  PTPageControlDemo
//
//  Created by 小虎 on 2019/4/22.
//  Copyright © 2019 OComme. All rights reserved.
//

import UIKit

class PublicSlipPointViewModel: NSObject {

}

extension PublicSlipPointViewModel: PTSlipPageControlDatasource{
    func sizeOfSlip(in pageControl: PTSlipPageControl) -> CGSize {
        return CGSize.init(width: 20, height: 20)
    }
    
    func slipView(in pageControl: PTSlipPageControl) -> UIView {
        let line = UIView.init()
        line.layer.cornerRadius = 10
        line.backgroundColor = UIColor.red
        return line
    }
    
    func widthOfSlip(in pageControl: PTSlipPageControl) -> CGFloat {
        return 40
    }
    
    func edgeInsetOfSlip(in pageControl: PTSlipPageControl) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 50, bottom: 0, right: 0)
    }
}
