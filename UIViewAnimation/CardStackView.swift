//
//  CardStackView.swift
//  UIViewAnimation
//
//  Created by Ishan Weerasooriya on 6/10/16.
//  Copyright © 2016 Ishan Weerasooriya. All rights reserved.
//

import UIKit

class CardStackView: UIView {
    
    var cards: [CardView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        defaultInit()
    }
    
    func defaultInit() {
    
        // add all people
        
        for person in people {
            addPerson(person)
        }
    }
    
    
    func addPerson(person: Person) {

        let card = NSBundle.mainBundle().loadNibNamed("CardView", owner: nil, options: nil)[0] as! CardView
        card.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        card.person = person
        self.addSubview(card)
        
        // send newly add view to back
        self.sendSubviewToBack(card)
        
        cards.append(card)
        
        // apply some transform
        setupTransforms(0)
        
        // add touch gesture
        if cards.count == 1 {
            card.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(CardStackView.pan(_:))))
        }
        
    }
    
    func setupTransforms(percentCompletion: Double) {
    
        for (i, card) in cards.enumerate() {
            
            if i == 0 {continue }
            
            var translationA, rotationA : CGFloat!
            var translationB, rotationB : CGFloat!

            
            if i % 2 == 0 {
                translationA = CGFloat(i)*4
                rotationA = CGFloat(M_PI)/200*CGFloat(i)
                
                translationB = -CGFloat(i-1)*4
                rotationB = -CGFloat(M_PI)/200*CGFloat(i-1)
                
            } else {
                translationA = -CGFloat(i)*4
                rotationA = -CGFloat(M_PI)/200*CGFloat(i)
                
                translationB = CGFloat(i-1)*4
                rotationB = CGFloat(M_PI)/200*CGFloat(i-1)
                
            }
            
            let translation = translationA*(1-CGFloat(percentCompletion)) + translationB*CGFloat(percentCompletion)
            let rotation = rotationA*(1-CGFloat(percentCompletion)) + rotationB*CGFloat(percentCompletion)
            
            var transform = CGAffineTransformIdentity
            transform = CGAffineTransformTranslate(transform, translation, 0)
            transform = CGAffineTransformRotate(transform, rotation)
            
            card.transform = transform
            
        }
    }
    
    
    func pan(gesture: UIPanGestureRecognizer) {
        
        let card = gesture.view as! CardView
        let translation = gesture.translationInView(self)
        
        var percent = translation.x / CGRectGetMidX(self.bounds)
        percent = min(percent, 1)
        percent = max(percent, -1)
        
        UIView.animateWithDuration(0.75, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 1, options: [], animations: { 
           
            self.setupTransforms(abs(Double(percent)))
            
            }) { (res) in
                // after completion
        }
        
        
         // transform when moving
        var transform = CGAffineTransformIdentity
        transform = CGAffineTransformTranslate(transform, translation.x, translation.y)
        transform = CGAffineTransformRotate(transform, CGFloat(M_PI)*percent/30)
        card.transform = transform
        
        
        // back to center when moving finish
        if gesture.state == .Ended {
        
            UIView.animateWithDuration(0.75, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 1, options: [], animations: {
                
                    card.transform = CGAffineTransformIdentity
                
                }, completion: { (complete) in
                    
            })
        }
        
    }
    
}
