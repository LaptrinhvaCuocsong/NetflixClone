//
//  NSAttributedString.swift
//  NetflixClone
//
//  Created by Apple on 8/30/20.
//

import Foundation
import UIKit

extension NSAttributedString {
    func font(_ font: UIFont) -> NSAttributedString {
        let attr = NSMutableAttributedString(attributedString: self)
        attr.addAttribute(.font, value: font, range: NSRange(location: 0, length: attr.length))
        return attr
    }

    func getWidth(maxHeight: CGFloat) -> CGFloat {
        let limitSize = CGSize(width: .infinity, height: maxHeight)
        let frame = boundingRect(with: limitSize, options: .usesLineFragmentOrigin, context: .none)
        return ceil(frame.width)
    }
}
