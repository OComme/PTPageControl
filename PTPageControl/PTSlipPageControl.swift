//
//  PTSlipPageControl.swift
//  PTPageControlDemo
//
//  Created by 小虎 on 2019/4/22.
//  Copyright © 2019 OComme. All rights reserved.
//
//  滑块的页面控制

import UIKit
import SnapKit

/// 创建滑块的代理方式
@objc protocol PTSlipPageControlDatasource: NSObjectProtocol {
    /// 滑块的尺寸
    func sizeOfSlip(in pageControl: PTSlipPageControl) -> CGSize
    
    /// 滑块的实例对象
    func slipView(in pageControl: PTSlipPageControl) -> UIView
    
    /// 滑块对标的格子大小，对应 animationFloat
    @objc optional func widthOfSlip(in pageControl: PTSlipPageControl) -> CGFloat
    
    /// 滑块的初始位置(当widthOfSlip 被实现时，自动对准第一个item)
    @objc optional func startCenterXOfSlip(in pageControl: PTSlipPageControl) -> CGFloat
    
    /// 内边距（左右边距），默认zero
    @objc optional func edgeInsetOfSlip(in pageControl: PTSlipPageControl) -> UIEdgeInsets
}

@IBDesignable
open class PTSlipPageControl: UIView {
    
    // MARK: default value
    /// 默认内边距
    static let defaultEdgeInset: UIEdgeInsets = .zero
    
    //MARK: api
    /// 当前选择的位置 实现dataSource的 widthOfSlip(in pageControl:_) 方法后自动调整位置
    /// 若是没有实现指定代理方法，则其值不能自动调整为偏移量对应的值
    var selectIndexPath: Int?{
        set{
            _selectIndexPath = newValue
        }
        get{
            guard dataSource.widthOfSlip != nil else { return nil }
            return _selectIndexPath
        }
    }
    private var _selectIndexPath: Int!
    
    /// 动画进度 需要先实现dataSource的 widthOfSlip(in pageControl:_) 方法
    var animationFloat: CGFloat!{
        didSet{
            if slipView == nil { return }
            
            guard let itemWidth = dataSource.widthOfSlip?(in: self) else { return }
            animationOffsetX = itemWidth * (animationFloat + 0.5) + marginLeft
        }
    }
    
    /// 滑块的位置偏移量
    var animationOffsetX: CGFloat!{
        didSet{
            if slipView == nil { return }
            let itemWidth = dataSource.widthOfSlip?(in: self)
            /// 通过滑块的初始位置和对标的格子大小计算其选择的位置
            _selectIndexPath = (itemWidth ?? 0 <= 0) ? 0 : Int(floor((animationOffsetX - marginLeft)/itemWidth!))

            
            let minAnimationOffset = (itemWidth ?? 0)/2.0 < 5 ? 5 : itemWidth!/2.0
            let showAnimation = abs(slipView!.center.x - animationOffsetX) > minAnimationOffset
            slipView?.snp.updateConstraints({ (make) in
                make.centerX.equalTo(animationOffsetX)
            })
            
            /// 距离变动不超过 10 的，不执行Layout动画
            if showAnimation == false { return }
            UIView.animate(withDuration: 0.3) {[weak self] in
                self?.layoutIfNeeded()
            }
        }
        
    }
    
    /// 滑块的创建配置
    @IBOutlet weak var dataSource: PTSlipPageControlDatasource!{
        didSet{
            reloadData()
        }
    }
    
    //MARK: - subView
    /// 当前创建出的滑块
    private weak var slipView: UIView?
    
    //MARK - init
    /// 左边距
    private var marginLeft: CGFloat!

    /// 更新滑块配置
    public func reloadData() {
        
        marginLeft = (dataSource.edgeInsetOfSlip?(in: self) ?? PTSlipPageControl.defaultEdgeInset).left
 
        slipView?.removeFromSuperview()
        slipView = nil
        
        commit_init()
    }
    
    private func commit_init() {
        subView_add()
        subView_layout()
    }
    
    // MARK: - subview
    private func subView_add() {
        /// 通过dataSource拿到滑块的实例对象
        let lineView = dataSource.slipView(in: self)
        addSubview(lineView)
        slipView = lineView
    }
    
    private func subView_layout() {
        /// 通过dataSource拿到滑块的尺寸
        let lineSize = dataSource.sizeOfSlip(in: self)
        /// 通过ataSource拿到滑块对标的格子大小
        let itemWidth = dataSource.widthOfSlip?(in: self)
        
        /// 滑块的初始位置
        var startCenterX: CGFloat!
        if dataSource.startCenterXOfSlip != nil {
            /// 通过dataSource拿到初始位置
            startCenterX = dataSource.startCenterXOfSlip!(in: self)
        }else if itemWidth != nil {
            /// 通过滑块对标的格子大小计算初始位置
            startCenterX = dataSource.widthOfSlip!(in: self)/2.0 + marginLeft
        }else{
            /// 通过滑块的尺寸计算初始位置
            startCenterX = lineSize.width/2.0 + marginLeft
        }
        /// 通过滑块的初始位置和对标的格子大小计算其选择的位置
        _selectIndexPath = (itemWidth ?? 0 <= 0) ? 0 : Int(floor((startCenterX - marginLeft)/itemWidth!))
        
        slipView!.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.size.equalTo(lineSize)
            make.centerX.equalTo(startCenterX)
        }
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
}
