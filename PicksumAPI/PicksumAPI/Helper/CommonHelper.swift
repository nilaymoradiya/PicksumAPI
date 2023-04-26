//
//  CommonHelper.swift
//  PicksumAPI
//
//  Created by Nilay M on 26/04/23.
//

import UIKit
import SVProgressHUD
import Reachability

class CommonHelper: NSObject {

    //MARK: - Progress View
    class func showProgress() {
        DispatchQueue.main.async {
            SVProgressHUD.show()
            if let wd = AppDelegate.shared().window {
                wd.isUserInteractionEnabled = false
            }
        }
    }
    
    class func hideProgress() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
            if let wd = AppDelegate.shared().window {
                wd.isUserInteractionEnabled = true
            }
        }
    }
    
    //MARK: - Alert Controller
    class func showAlert(title: String?, message: String?) {
        let alertController  = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        if let wd = AppDelegate.shared().window {
            
            var vc = wd.rootViewController
            if(vc is UINavigationController){
                vc = (vc as! UINavigationController).visibleViewController
            }
            if let popoverPresentationController = alertController.popoverPresentationController {
                popoverPresentationController.sourceView = vc?.view
                popoverPresentationController.sourceRect = CGRect(x: (vc?.view.bounds.size.width)! / 2.0, y: (vc?.view.bounds.size.height)! / 2.0, width: 1.0, height: 1.0)
            }
            DispatchQueue.main.async {
                vc!.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    //MARK: - Reachability
    class func isConnectedToNetwork() -> Bool {
        do {
            let reachability = try? Reachability()
            switch reachability!.connection {
            case .wifi:
                print("Connected With wifi")
                return true
            case .cellular:
                print("Connected With Cellular network(3G/4G)")
                return true
            case .none:
                print("Not Connected")
                return false
            case .unavailable:
                return false
            }
        }
    }
    
    class func showInternetNotConnectedDialogue() {
        CommonHelper.showAlert(title: "No Internet!", message: "It seems you are not connected to the internet, Kindly connect and try again.")
    }
}
