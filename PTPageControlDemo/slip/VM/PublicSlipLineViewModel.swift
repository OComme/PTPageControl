

//
//  PublicSlipLineViewModel.swift
//  PTPageControlDemo
//
//  Created by 小虎 on 2019/4/22.
//  Copyright © 2019 OComme. All rights reserved.
//

import UIKit

class PublicSlipLineViewModel: NSObject {

}

extension PublicSlipLineViewModel: PTSlipPageControlDatasource{
    func sizeOfSlip(in pageControl: PTSlipPageControl) -> CGSize {
        return CGSize.init(width: 40, height: 5)
    }
    
    func slipView(in pageControl: PTSlipPageControl) -> UIView {
        let line = UIView.init()
        line.backgroundColor = UIColor.red
        return line
    }
    
    func widthOfSlip(in pageControl: PTSlipPageControl) -> CGFloat {
        return 50
    }
    
    func edgeInsetOfSlip(in pageControl: PTSlipPageControl) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 90, bottom: 0, right: 0)
    }
}
