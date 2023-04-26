//
//  SplashVC.swift
//  Picksum
//
//  Created by Nilay M on 26/04/23.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            let vc = PicksumVC.instantiate(appStoryboard: .main)
            self.navigationController?.setViewControllers([vc], animated: true)
        }
    }

}
