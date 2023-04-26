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
    
    fileprivate var _item : PicksumModel?
    var item : PicksumModel? {
        get { return _item }
        set {
            _item = newValue
            reload()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func reload() {
        guard let item = item else {
            return
        }
        lblTitle.text = item.author
        lblDescription.text = item.downloadUrl
        imgPicksum.loadImage(item.downloadUrl)
        btnCheck.setImage(UIImage(named: item.isSelected ? "ic_checkbox_selected" : "ic_checkbox_unselected"), for: .normal)
    }
    
    
    @IBAction func didClickOnCheckButton(_ sender: Any) {
        guard let item = item else {
            return
        }
        item.isSelected = !item.isSelected
        reload()
    }
    
}
