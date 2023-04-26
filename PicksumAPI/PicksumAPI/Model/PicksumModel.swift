//
//  PicksumModel.swift
//  PicksumAPI
//
//  Created by Nilay M on 26/04/23.
//

import UIKit
import ObjectMapper

class PicksumModel : Mappable {
    var id : String?
    var author : String?
    var width : CGFloat?
    var height : CGFloat?
    var url : String?
    var downloadUrl : String?
    var isSelected : Bool = false
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        id <- map["id"]
        author <- map["author"]
        width <- map["width"]
        height <- map["height"]
        url <- map["url"]
        downloadUrl <- map["download_url"]
        isSelected <- map["isSelected"]
    }
    
}
