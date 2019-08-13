

import UIKit
import SwiftPhoneNumberFormatter
class EditPhoneViewController: UIViewController {
    
    var editPhone : EditPhoneView {return self.view as! EditPhoneView}
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        super.loadView()
        self.view = EditPhoneView(frame: self.view.bounds)
    }

}
