

import UIKit
import SwiftPhoneNumberFormatter
class EditPhoneViewController: UIViewController {
    
    var editPhone : EditPhoneView {return self.view as! EditPhoneView}
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        editPhone.send_button.addTarget(self, action: #selector(go), for: .touchUpInside)

    }
    @objc func go() {
        self.navigationController?.pushViewController(EditPassCodeeViewController(), animated: true)
    }
    
    override func loadView() {
        super.loadView()
        self.view = EditPhoneView(frame: self.view.bounds)
    }

}
