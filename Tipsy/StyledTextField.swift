//
//  StyledTextField.swift
//  Tipsy
//
//  Created by Michel Besnard on 2016-07-13.
//  Copyright © 2016 Michel Besnard. All rights reserved.
//

import UIKit

@IBDesignable
class StyledTextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var bgColor: UIColor? {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
        self.layer.borderColor = borderColor?.cgColor

        }
    }
    
        @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
        self.layer.borderWidth = borderWidth
        
        }
        }
    
        @IBInspectable var placeholderColor: UIColor? {
        didSet {
        let str = self.attributedPlaceholder?.string
        if str != nil && str?.characters.count > 0 {
        self.attributedPlaceholder = AttributedString(string: str!, attributes: [NSForegroundColorAttributeName: placeholderColor!])
        
        }
        
        }

        }
        
}

