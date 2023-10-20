//
//  UIView+Extension.swift
//  MobentTestCase
//
//  Created by Berkay Unal on 20.10.2023.
//

import UIKit

extension UIView {
    func round( _ radious: CGFloat = 10) {
        self.layer.cornerRadius = radious
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
