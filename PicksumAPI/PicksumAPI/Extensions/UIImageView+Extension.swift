//
//  UIImageView+Extension.swift
//  PicksumAPI
//
//  Created by Nilay M on 26/04/23.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    
    func loadImage(_ urlString: String?, onSuccess: ((UIImage?) -> Void)? = nil) {
        guard let string = urlString?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: string) else { return }
        DispatchQueue.global(qos: .background).async {
            self.sd_setImage(with: url, placeholderImage: UIImage(named: "image_placeholder"), options: .refreshCached, completed: { (image, error, catchType, url) in
                if onSuccess != nil, error == nil, let image = image {
                    onSuccess!(image)
                }
                else {
                    onSuccess?(nil)
                }
            })
        }
    }
    
}
