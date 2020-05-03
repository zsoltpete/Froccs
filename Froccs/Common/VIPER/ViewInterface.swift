import UIKit

protocol ViewInterface: class {
    func showProgressHUD()
    func hideProgressHUD()
    func setTitle(_ title: String)
}

extension ViewInterface {

    func showProgressHUD() {
    }

    func hideProgressHUD() {
    }
}
