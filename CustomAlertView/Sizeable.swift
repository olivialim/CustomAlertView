//
//  Sizeable.swift
//  CustomAlertView
//
//  Created by Olivia Lim on 6/30/16.
//  Copyright © 2016 Olivia Lim. All rights reserved.
//

import UIKit

protocol Sizeable {
    func calculateHeight(width: CGFloat) -> CGSize
}


class SizeableLabel: UILabel, Sizeable {}

extension SizeableLabel {
    
    func calculateHeight(width: CGFloat) -> CGSize {
        guard let text = self.text else {
            return CGSize.zero
        }
        
        let size = text.boundingRectWithSize(CGSize(width: width, height: CGFloat.max),
                                             options: [.UsesLineFragmentOrigin],
                                             attributes: [NSFontAttributeName: self.font],
                                             context: nil).size
        
        return size
    }
}


