//
//  ReusableProtocol.swift
//  iTunesSearchAPIRx
//
//  Created by 황인호 on 11/8/23.
//

import UIKit

protocol ReusableViewProtocol {
    static var identifier: String { get }
}

extension UITableViewCell: ReusableViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

