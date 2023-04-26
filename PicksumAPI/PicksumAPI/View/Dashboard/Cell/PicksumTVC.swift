//
//  PicksumTVC.swift
//  PicksumAPI
//
//  Created by Nilay M on 26/04/23.
//

import UIKit

class PicksumTVC: UITableViewCell {
    
    class var className : String{ return "PicksumTVC" }
    
    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var imgPicksum: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func didClickOnCheckButton(_ sender: Any) {
       
    }
    
}
