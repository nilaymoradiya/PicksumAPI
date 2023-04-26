//
//  PicksumViewModel.swift
//  PicksumAPI
//
//  Created by Nilay M on 26/04/23.
//

import UIKit

class PicksumViewModel: NSObject {

    fileprivate let repo: PicksumRepository = PicksumRepository()
    var page: Int = 1
    var items: [PicksumModel] = []
    
    func getImages(completion : @escaping (_ response : Bool) -> ()) {
        CommonHelper.showProgress()
        repo.getImages(page: page) { response in
            CommonHelper.hideProgress()
            if response != nil {
                self.items.append(contentsOf: response!)
                completion(true)
            }
            else {
                completion(false)
            }
        }
    }
    
}
