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
    var isLoadMoreRecord = true
    var items: [PicksumModel] = []
    
    func resetAllData() {
        page = 1
        isLoadMoreRecord = true
        items.removeAll()
    }
    
    func getImges(completion : @escaping (_ response : Bool) -> ()) {
        CommonHelper.showProgress()
        repo.getImages(page: page) { response in
            CommonHelper.hideProgress()
            if response != nil {
                self.isLoadMoreRecord = !response!.isEmpty
                self.items.append(contentsOf: response!)
                completion(true)
            }
            else {
                self.isLoadMoreRecord = false
                completion(false)
            }
        }
    }
    
}
