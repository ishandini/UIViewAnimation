//
//  RectangleView.swift
//  UIViewAnimation
//
//  Created by Ishan Weerasooriya on 6/10/16.
//  Copyright © 2016 Ishan Weerasooriya. All rights reserved.
//

import UIKit

class RectangleView: UIView {
    
     let animateView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.defaultInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.defaultInit()
    }
    
    
    func defaultInit() {
    
        self.backgroundColor = UIColor.yellowColor()
        self.addSubview(animateView)
        
        animateView.frame = CGRectMake(0, 100, 100, 100)
        animateView.backgroundColor = UIColor.orangeColor()
        
        
        // One
        /*
         UIView.animateWithDuration(2.0) {
         self.backgroundColor = UIColor.greenColor()
         self.animateView.center = CGPointMake(100, 100)
         puts("foo")
         }
         puts("bar")
         */
        
        // Two
        /*
         UIView.animateWithDuration(2.0, animations: {
         
         self.backgroundColor = UIColor.greenColor()
         self.animateView.center = CGPointMake(100, 100)
         
         }) { (res) in
         
         puts("animation complete")
         }
         */
        
        // Three
        /*
         UIView.animateWithDuration(2.0, delay: 3.0, options: [], animations: {
         self.backgroundColor = UIColor.greenColor()
         self.animateView.center = CGPointMake(100, 100)
         
         }) { (res) in
         puts("animation complete")
         }
         */
        
        // Four
        /*
         UIView.animateWithDuration(2.0, delay: 1, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [], animations: {
         
         self.animateView.center = CGPointMake(200, 50)
         
         }) { (complete) in
         
         puts("done")
         }
         */
        
        // Infinity
        /*
         UIView.animateWithDuration(1.0) {
         UIView.setAnimationRepeatCount(Float.infinity)
         UIView.setAnimationRepeatAutoreverses(true)
         
         self.animateView.center = CGPointMake(100, 100)
         }
         */
        
        /*
         UIView.animateWithDuration(10.0, delay: 1.0, options: [.CurveEaseOut], animations: {
         self.animateView.center = CGPointMake(200, 50)
         }, completion: nil)
         
         
         let time = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC * 3))
         dispatch_after(time, dispatch_get_main_queue()) {
         
         UIView.animateWithDuration(10.0, delay: 1.0, options: [.CurveEaseOut], animations: {
         self.animateView.center = CGPointMake(50, 200)
         }, completion: nil)
         }
         */
        
        
        // Transform 1
        /*
         UIView.animateWithDuration(4.0) {
         let transform = CGAffineTransformMakeTranslation(100, 0)
         self.animateView.transform = transform
         }
         */
        
        // Transform 2
        /*
         UIView.animateWithDuration(4.0) {
         var transform = CGAffineTransformIdentity
         transform = CGAffineTransformTranslate(transform, 100, 0)
         transform = CGAffineTransformRotate(transform, CGFloat(M_PI)/4)
         transform = CGAffineTransformScale(transform, 0.5, 0.5)
         self.animateView.transform = transform
         }
         */
        
        
        
        // Animate Keyframe
        
         UIView.animateKeyframesWithDuration(4.0, delay: 0, options: [], animations: {
         
         UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5, animations: {
         self.animateView.center = CGPointMake(200, 150)
         })
         
         UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.5, animations: {
         self.animateView.center = CGPointMake(200, 300)
         })
         
         }) { (complete) in
         puts("done")
         }
        
        

        
     }
    
    
    
    
}
