

import UIKit
import SwiftPhoneNumberFormatter
class ForgetPassController: UIViewController {
    
    var editPhone : ForgetPassViews {return self.view as! ForgetPassViews}
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
//        editPhone.send_button.addTarget(self, action: #selector(go), for: .touchUpInside)

    }
    @objc func go() {
        self.navigationController?.pushViewController(EditPassCodeeViewController(), animated: true)
    }
    
    override func loadView() {
        super.loadView()
        self.view = ForgetPassViews(frame: self.view.bounds)
    }

}
