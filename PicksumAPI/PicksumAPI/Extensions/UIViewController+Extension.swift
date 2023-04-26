//
//  UIViewController+Extension.swift
//  Picksum
//
//  Created by Nilay M on 26/04/23.
//

import UIKit

extension UIViewController {
    
    class func instantiate<T: UIViewController>(appStoryboard: AppStoryboard) -> T {
        let storyboard = UIStoryboard(name: appStoryboard.rawValue, bundle: nil)
        let identifier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
