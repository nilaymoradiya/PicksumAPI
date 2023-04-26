//
//  PicksumRepository.swift
//  PicksumAPI
//
//  Created by Nilay M on 26/04/23.
//

import UIKit
import ObjectMapper
import Alamofire

class PicksumRepository: NSObject {

    func getImages(page: Int, completion : @escaping (_ response : [PicksumModel]?) -> ()) {
        
        guard CommonHelper.isConnectedToNetwork() else {
            completion(nil)
            return
        }
        
        let api = kBaseUrl + "list?page=\(page)&limit=20"
        Alamofire.request(api, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseString { (data) in
            
            print(data)
            guard data.result.isSuccess else {
                completion(nil)
                return
            }
            guard let values = data.result.value else {
                completion(nil)
                return
            }
            let array = Mapper<PicksumModel>().mapArray(JSONString: values)
            completion(array)
        }
    }
}

