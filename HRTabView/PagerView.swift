//
//  PagerView.swift
//  Custom Pager
//
//  Created by MacBook Pro on 06/01/2016.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

import UIKit

protocol PagerViewDelegate
{
    func didTapAtIndex(index:Int)
    func didScrollToIndex(index:Int)
}

class PagerView: UIView  ,UIScrollViewDelegate{

    private var items:[String] = []
    private let strip:UIView = UIView()
    private var scrollView:UIScrollView = UIScrollView()
    private var currentPage = 0
    private var refPage = 0
    var delegate:PagerViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    init(frame: CGRect, tabs:[String]) {
        super.init(frame: frame)
        
        self.items = tabs
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
}

extension PagerView {
    
    func setup(){
        
        var x = 0
        let btnHeight = 50
        let viewWidth = self.frame.size.width
        let btnWidth = Float(viewWidth)/Float(items.count)
        
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: Int(viewWidth), height: btnHeight))
        topView.backgroundColor = UIColor.orangeColor()
        self.addSubview(topView)
        
        var btnTag = 1
        
        for btnTitle in items
        {
            let btn = UIButton(frame: CGRect(x: x, y: 0, width: Int(btnWidth), height: btnHeight))
            btn.setTitle(btnTitle, forState: .Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(12.0)
            btn.addTarget(self, action: "btnDidTap:", forControlEvents: .TouchUpInside)
            btn.tag = btnTag
            btnTag++
            topView.addSubview(btn)
            x = x+Int(btnWidth)
        }
        
        strip.frame = CGRect(x: CGFloat(0), y: CGFloat(44), width: CGFloat(btnWidth), height: CGFloat(5))
        strip.backgroundColor = UIColor.whiteColor()
        topView.addSubview(strip)
    }
    
    func btnDidTap(sender:UIButton)
    {
        delegate?.didTapAtIndex(sender.tag - 1)
        slideStrip(Float(sender.tag))
        slideScrollView(sender.tag)
    }
    
    func slideScrollView(index:Int)
    {
        print(index)
        UIView.animateWithDuration(0.5) { () -> Void in
            
            self.scrollView.contentOffset = CGPoint(x: CGFloat(index-1)*self.scrollView.frame.size.width, y: self.scrollView.contentOffset.y)
        }
    }
    
    func slideStrip(index:Float)
    {
        let viewWidth = self.frame.size.width
        let btnWidth = Float(viewWidth)/Float(items.count)
        let newX = Float(index - 1)*Float(btnWidth)+Float(btnWidth/2)
        
        UIView.animateWithDuration(0.1, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            
            self.strip.layer.position = CGPoint(x: CGFloat(newX), y: self.strip.layer.position.y)
            
            }, completion: { (done) -> Void in
                
        })
    }
    
    func scrollViewDidScroll(scroll: UIScrollView) {
        
        
        if scroll == scrollView
        {
            
            let currentPosition = floor(scrollView.contentOffset.x);
            
            currentPage = max(0, Int(floor(currentPosition / scrollView.frame.size.width)))
            
            if(currentPage != refPage)  {
                
                refPage = currentPage;
                self.delegate?.didScrollToIndex(refPage)
                slideStrip(Float(refPage+1))
            }
        }
    }
    
}


class StripView : UIView
{
    override func drawRect(rect: CGRect) {
        
        let path = UIBezierPath()
        path.lineWidth = 0.5
        UIColor.orangeColor().setStroke()
        let y = self.frame.size.height
        let width = self.frame.size.width
        path.moveToPoint(CGPoint(x: 0, y: y-0.5))
        path.addLineToPoint(CGPoint(x: width, y: y-0.5))
        path.stroke()
    }
}






