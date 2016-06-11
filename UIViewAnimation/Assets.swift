//
//  Assets.swift
//  UIViewAnimation
//
//  Created by Ishan Weerasooriya on 6/10/16.
//  Copyright © 2016 Ishan Weerasooriya. All rights reserved.
//

import UIKit

struct Person {
    
    var name: String
    var age: Int
    var image: UIImage
    
}

// create people global array
let people: [Person] = [
                Person(name: "Lakshmi Menon", age: 24, image:UIImage(named: "pic_0.jpg")! ),
                Person(name: "Malavika Nair", age: 20, image:UIImage(named: "pic_1.jpg")! ),
                Person(name: "Neena Kulkarni", age: 27, image:UIImage(named: "pic_2.jpg")! ),
                Person(name: "Pooja Bhatt", age: 30, image:UIImage(named: "pic_3.jpg")! ),
                Person(name: "Shilpa Tulaskar", age: 32, image:UIImage(named: "pic_4.jpg")! )
            ]