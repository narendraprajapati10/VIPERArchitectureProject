//
//  Global.swift
//  VIPERArchitectureProject
//
//  Created by WhyQ on 22/06/24.
//

import UIKit

open class Global {
    open class func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert);
        let alertAction = UIAlertAction(title: "ok", style: .cancel) { (alert) in
            UIApplication.topViewController()?.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)

        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
    //    open class func showAlert(title: String,
    //                              message: String,
    //                              alertStyle:UIAlertController.Style,
    //                              actionTitles:[String],
    //                              actionStyles:[UIAlertAction.Style],
    //                              actions: [((UIAlertAction) -> Void)]){
    //
    //        let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
    //        for(index, indexTitle) in actionTitles.enumerated(){
    //            let action = UIAlertAction(title: indexTitle, style: actionStyles[index], handler: actions[index])
    //            alertController.addAction(action)
    //        }
    //        UIApplication.topViewController()?.present(alertController, animated: true)
    //    }
}
