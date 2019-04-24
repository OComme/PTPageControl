//
//  PTDotPageControl.swift
//  PTPageControlDemo
//
//  Created by 小虎 on 2019/4/19.
//  Copyright © 2019 OComme. All rights reserved.
//
//  固定块的页面控制

import UIKit
import SnapKit

/// 创建dot的代理方式
@objc public protocol PTDotPageControlDatasource: NSObjectProtocol {
    /// 圆点的数量
    func numberOfDot(in pageControl: PTDotPageControl) -> Int
    
    /// 特定位置的圆点实例对象
    func dotView(in pageControl: PTDotPageControl, index: Int) -> UIView
    
    /// 圆点的尺寸
    func sizeOfDot(in pageControl: PTDotPageControl, index: Int) -> CGSize

    /// 圆点间的间隙 默认为10
    @objc optional func spaceOfDot(in pageControl: PTDotPageControl, index: Int) -> CGFloat
    
    /// 内边距（左右边距），默认zero
    @objc optional func edgeInsetOfDot(in pageControl: PTDotPageControl) -> UIEdgeInsets
}

/// dot的逻辑处理
@objc public protocol PTDotPageControlDelegate: NSObjectProtocol {
    /// 选中了某一个点
    func dotViewDidSelected(in pageControl: PTDotPageControl, dotView: UIView, index: Int)
    
    /// 对某一个点取消选中
    @objc optional func dotViewCancelSelect(in pageControl: PTDotPageControl, dotView: UIView, index: Int)
}


open class PTDotPageControl: UIView {
    
    // MARK: default value
    /// 默认间距
    static let defaultDotSpace: CGFloat = 10
    /// 默认内边距
    static let defaultEdgeInset: UIEdgeInsets = .zero

    //MARK: protcol
    /// dot的相关逻辑
    @IBOutlet public weak var delegate: PTDotPageControlDelegate?{
        didSet{
            if delegate == nil || dotEntitys.count == 0 || dotEntitys.first == selectDotView { return }
            delegate?.dotViewDidSelected(in: self, dotView: dotEntitys.first!, index: 0)
            selectDotView = dotEntitys.first
        }
    }
    
    /// dot的创建配置
    @IBOutlet public weak var dataSource: PTDotPageControlDatasource!{
        didSet{
            reloadData()
        }
    }
    
    //MARK: api
    
    /// 获取指定位置的dotView
    open func dotView(for index: Int) -> UIView?{
        if index < 0 || index > dotEntitys.count - 1 { return nil }
        return dotEntitys[index]
    }
    
    /// 当前选中的dot位置
    open var selectIndexPath: Int!{
        set{
            _selectIndexPath = newValue
            if _selectIndexPath > dotEntitys.count - 1 {
                _selectIndexPath = dotEntitys.count - 1
            }
            clickDotBtn(sender: dotEntitys[_selectIndexPath])
        }
        get{
            return _selectIndexPath
        }
    }
    private var _selectIndexPath: Int! = 0
    
    //MARK: - data
    /// 当前选中的dot
    private weak var selectDotView: UIView?
    
    /// dot集合
    private var dotEntitys: [UIView]! = Array.init()

    
    // MARK: - init
    /// 更新线条配置
    public func reloadData() {
        for view in dotEntitys {
            view.removeFromSuperview()
        }
        dotEntitys.removeAll()
        selectDotView = nil
        
        commit_init()
    }
    
    private func commit_init() {
        /// 过渡view
        var tempView: UIView?
        /// 通过dataSource拿到dot的内边距
        let edgeInset = dataSource.edgeInsetOfDot?(in: self) ?? PTDotPageControl.defaultEdgeInset
        /// 通过dataSource拿到dot的数量
        let dotNumber = dataSource.numberOfDot(in: self)
        
        for idx in 0..<dotNumber {
            
            /// 通过dataSource拿到dot的尺寸
            let dotSize = dataSource.sizeOfDot(in: self, index: idx)
            /// 通过dataSource拿到dot的实例对象
            let dotView = dataSource.dotView(in: self, index: idx)
            dotEntitys.append(dotView)
            /// 格子间隙：默认10
            var dotSpace: CGFloat = PTDotPageControl.defaultDotSpace
            
            addSubview(dotView)
            if idx == 0 {
                delegate?.dotViewDidSelected(in: self, dotView: dotView, index: 0)
                selectDotView = dotView
            }else{
                /// 通过dataSource拿到dot的间距
                dotSpace = dataSource.spaceOfDot?(in: self, index: idx) ?? PTDotPageControl.defaultDotSpace
            }
            
            /// 如果dot为UIcontrol的子类，赋予其点击事件
            if let btn = dotView as? UIControl {
                btn.addTarget(self, action: #selector(clickDotBtn(sender:)), for: UIControl.Event.touchUpInside)
            }
            
            dotView.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.size.equalTo(dotSize)
                if tempView != nil{
                    make.left.equalTo(tempView!.snp.right).offset(dotSpace)
                }else{
                    make.left.equalTo(edgeInset.left).priority(.high)
                }
                if idx == (dotNumber - 1){
                    make.right.equalTo(-edgeInset.right).priority(.high)
                }
            }
            
            tempView = dotView
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

extension PTDotPageControl {
    /// 点击dotiView
    @objc func clickDotBtn(sender: UIView) {
        if let idx = dotEntitys.firstIndex(of: sender){
            _selectIndexPath = idx
        }
        if _selectIndexPath > dotEntitys.count - 1 {
            _selectIndexPath = dotEntitys.count - 1
        }
        
        delegate?.dotViewDidSelected(in: self, dotView: sender, index: _selectIndexPath)
        if selectDotView != nil && selectDotView != sender {
            delegate?.dotViewCancelSelect?(in: self, dotView: selectDotView!, index: _selectIndexPath)
        }
        selectDotView = sender
    }
}
