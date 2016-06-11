//
//  CardView.swift
//  UIViewAnimation
//
//  Created by Ishan Weerasooriya on 6/10/16.
//  Copyright © 2016 Ishan Weerasooriya. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    @IBOutlet var imgPerson: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblAge: UILabel!
    
    
    var person: Person! {
    
        didSet {
        
            imgPerson.image = person.image
            lblName.text = person.name
            lblAge.text = "Age: \(person.age)"
        }
    }
    
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        defaultInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultInit()
    }
    
    override func awakeFromNib() {
        defaultInit()
    }
    
    func defaultInit() {
    
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
    }

}
