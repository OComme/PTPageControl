

//
//  PublicSlipViewController.swift
//  PTPageControlDemo
//
//  Created by 小虎 on 2019/4/22.
//  Copyright © 2019 OComme. All rights reserved.
//

import UIKit

class PublicSlipViewController: UIViewController {

    @IBOutlet weak var slipImageView: PTSlipPageControl!
    @IBOutlet weak var lineView: PTSlipPageControl!
    @IBOutlet weak var pointView: PTSlipPageControl!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - viewModel
    /// 滑动线条
    private var vm_slipLine = PublicSlipLineViewModel.init()
    /// 滑动点
    private var vm_slipPoint = PublicSlipPointViewModel.init()

    /// 滑动图
    private var vm_slipImage = PublicSlipImageViewModel.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize.init(width: scrollView.bounds.width*6, height: 0)
        
        setIndex_viewModel()
    }
    
    func setIndex_viewModel() {
        lineView.dataSource = vm_slipLine
        
        pointView.dataSource = vm_slipPoint
        
        slipImageView.dataSource = vm_slipImage

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
        lineView.animationFloat = scrollView.contentOffset.x/scrollView.bounds.width
        pointView.animationFloat = scrollView.contentOffset.x/scrollView.bounds.width
        slipImageView.animationFloat = scrollView.contentOffset.x/scrollView.bounds.width

    }
    
}
