//
//  PublicSlipImageViewModel.swift
//  PTPageControlDemo
//
//  Created by 小虎 on 2019/4/22.
//  Copyright © 2019 OComme. All rights reserved.
//

import UIKit

class PublicSlipImageViewModel: NSObject {

}

extension PublicSlipImageViewModel: PTSlipPageControlDatasource{
    func sizeOfSlip(in pageControl: PTSlipPageControl) -> CGSize {
        return CGSize.init(width: 40, height: 40)
    }
    
    func slipView(in pageControl: PTSlipPageControl) -> UIView {
        let imageView = UIImageView.init(image: UIImage.init(named: "ios-marketing"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    func widthOfSlip(in pageControl: PTSlipPageControl) -> CGFloat {
        return 50
    }
    
}

