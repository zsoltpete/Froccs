//
//  BaseViewController.swift
//  citychat
//
//  Created by Levente Vig on 2019. 07. 10..
//  Copyright © 2019. CodeYard. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }
    
    func setTitle(_ title: String) {
        if (navigationController?.viewControllers.count == 1) {
            tabBarController?.navigationItem.title = title
        } else {
            navigationItem.title = title
        }
        
    }
}
