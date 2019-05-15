# PTPageControl
a pageControl with swift

PTSlipPageControl 的构建方法
```
    /// 创建滑块的代理方式
    PTSlipPageControlDatasource

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
```

PTDotPageControl 的构建方法
```
    /// 创建dot的代理方式
    PTDotPageControlDatasource
    
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
    
    /// 将要选中了某一个点(样式变化)
    func dotViewWillSelect(in pageControl: PTDotPageControl, dotView: UIView, index: Int)
    
    /// 将要对某一个点取消选中(样式变化)
    func dotViewWillCancelSelect(in pageControl: PTDotPageControl, dotView: UIView, index: Int)
```
