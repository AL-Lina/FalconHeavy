//
//  UIViewController + Extensions.swift
//  FalconHeavy
//
//  Created by Alina Sakovskaya on 7.04.24.
//

import UIKit

extension UIViewController {
    
    func createCustomButton(selector: Selector, image: String, color: UIColor) -> UIBarButtonItem {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: image), for: .normal)
        button.tintColor = color
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }
}
