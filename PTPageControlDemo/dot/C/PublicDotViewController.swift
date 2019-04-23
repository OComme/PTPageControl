

//
//  PublicDotViewController.swift
//  PTPageControlDemo
//
//  Created by 小虎 on 2019/4/19.
//  Copyright © 2019 OComme. All rights reserved.
//

import UIKit

class PublicDotViewController: UIViewController {

    @IBOutlet weak var dotCircleView: PTDotPageControl!
    
    @IBOutlet weak var dotRectView: PTDotPageControl!

    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - viewModel
    /// 滑动线条
    private var vm_dotRect = PublicDotRectangleViewModel.init()

    /// 圆
    private var vm_dotCircle = PublicDotCircleViewModel.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize.init(width: scrollView.bounds.width*6, height: 0)
        
        setIndex_viewModel()
    }
    
    func setIndex_viewModel() {
        dotRectView.dataSource = vm_dotRect
        dotRectView.delegate = vm_dotRect
        
        dotCircleView.dataSource = vm_dotCircle
        dotCircleView.delegate = vm_dotCircle

    }
}


extension PublicDotViewController: UIScrollViewDelegate{

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        dotRectView.selectIndexPath = Int(scrollView.contentOffset.x/scrollView.bounds.width)
        dotCircleView.selectIndexPath = Int(scrollView.contentOffset.x/scrollView.bounds.width)

    }
}
