//
//  AddButton.swift
//  CustomAlertView
//
//  Created by Olivia Lim on 7/1/16.
//  Copyright © 2016 Olivia Lim. All rights reserved.
//

import UIKit

protocol AddButton {
    
    func addButton()
    
}

extension AddButton {

    func addButton() {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("OK", forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(15)
        button.backgroundColor = .greenColor()
        button.frame.size.height = 50.0;
    
    }
    
}