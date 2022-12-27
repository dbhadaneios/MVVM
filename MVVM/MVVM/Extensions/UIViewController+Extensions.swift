//
//  UIViewController+Extensions.swift
//  MVVM
//
//  Created by Dinesh R Bhaddane on 27/12/2022.
//

import UIKit

extension UIViewController {
    /// To show Alert
    /// - Parameter message: alert message
    func showAlert( _ message: String ) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
