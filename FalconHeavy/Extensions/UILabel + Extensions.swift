//
//  UILabel + Extensions.swift
//  FalconHeavy
//
//  Created by Alina Sakovskaya on 7.04.24.
//

import UIKit

extension UILabel {
    convenience init(text: String = "", font: UIFont?, color: UIColor) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
