

//
//  PublicSlipViewController.swift
//  PTPageControlDemo
//
//  Created by 小虎 on 2019/4/22.
//  Copyright © 2019 OComme. All rights reserved.
//

import UIKit

class PublicSlipViewController: UIViewController {

    @IBOutlet weak var slipView_image: PTSlipPageControl!
    @IBOutlet weak var slipView_line: PTSlipPageControl!
    @IBOutlet weak var slipView_point: PTSlipPageControl!
    
    @IBOutlet weak var slipView_label: PTSlipPageControl!

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - viewModel
    /// 滑动线条
    private var vm_slipLine = PublicSlipLineViewModel.init()
    /// 滑动点
    private var vm_slipPoint = PublicSlipPointViewModel.init()
    /// 滑动图
    private var vm_slipImage = PublicSlipImageViewModel.init()
    /// 滑动文本
    private var vm_slipLabel = PublicSlipLabelViewModel.init()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize.init(width: scrollView.bounds.width*6, height: 0)
        
        setIndex_viewModel()
    }
    
    func setIndex_viewModel() {
        slipView_line.dataSource = vm_slipLine
        
        slipView_point.dataSource = vm_slipPoint
        
        slipView_image.dataSource = vm_slipImage

        slipView_label.dataSource = vm_slipLabel
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension PublicSlipViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        slipView_line.animationFloat = scrollView.contentOffset.x/scrollView.bounds.width
        slipView_point.animationFloat = scrollView.contentOffset.x/scrollView.bounds.width
        slipView_image.animationFloat = scrollView.contentOffset.x/scrollView.bounds.width
        slipView_label.animationFloat = scrollView.contentOffset.x/scrollView.bounds.width

    }
    
}
