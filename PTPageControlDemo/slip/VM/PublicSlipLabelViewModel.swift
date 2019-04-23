//
//  PublicSlipLabelViewModel.swift
//  PTPageControlDemo
//
//  Created by 小虎 on 2019/4/23.
//  Copyright © 2019 OComme. All rights reserved.
//

import UIKit

class PublicSlipLabelViewModel: NSObject {

}

extension PublicSlipLabelViewModel: PTSlipPageControlDatasource{
    func sizeOfSlip(in pageControl: PTSlipPageControl) -> CGSize {
        return CGSize.init(width: 70, height: 20)
    }
    
    func slipView(in pageControl: PTSlipPageControl) -> UIView {
        let label = UILabel.init()
        label.text = "真的皮"
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 4
        label.backgroundColor = UIColor.gray
        label.textColor = UIColor.white
        return label
    }
    
    func widthOfSlip(in pageControl: PTSlipPageControl) -> CGFloat {
        return 80
    }
    
}
