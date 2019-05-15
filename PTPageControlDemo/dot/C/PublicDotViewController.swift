

//
//  PublicDotViewController.swift
//  PTPageControlDemo
//
//  Created by 小虎 on 2019/4/19.
//  Copyright © 2019 OComme. All rights reserved.
//

import UIKit

class PublicDotViewController: UIViewController {

    @IBOutlet weak var dotView_circle: PTDotPageControl!
    
    @IBOutlet weak var dotView_rect: PTDotPageControl!
    
    @IBOutlet weak var dotView_image: PTDotPageControl!

    @IBOutlet weak var dotView_label: PTDotPageControl!


    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - viewModel
    /// 长条型
    private var vm_dotRect = PublicDotRectangleViewModel.init()

    /// 圆
    private var vm_dotCircle = PublicDotCircleViewModel.init()
    
    /// 图片
    private var vm_dotImage = PublicDotImageViewModel.init()
    
    /// 文本
    private var vm_dotLabel = PublicDotLabelViewModel.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize.init(width: scrollView.bounds.width*6, height: 0)
        
        setIndex_viewModel()
    }
    
    func setIndex_viewModel() {
        dotView_rect.dataSource = vm_dotRect
        
        dotView_circle.dataSource = vm_dotCircle

        dotView_image.dataSource = vm_dotImage
        
        dotView_label.dataSource = vm_dotLabel
    }
}


extension PublicDotViewController: UIScrollViewDelegate{

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        dotView_rect.selectIndexPath = Int(scrollView.contentOffset.x/scrollView.bounds.width)
        dotView_circle.selectIndexPath = Int(scrollView.contentOffset.x/scrollView.bounds.width)
        dotView_image.selectIndexPath = Int(scrollView.contentOffset.x/scrollView.bounds.width)
        dotView_label.selectIndexPath = Int(scrollView.contentOffset.x/scrollView.bounds.width)
    }
}
