//
//  EditPhoneViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SwiftPhoneNumberFormatter
class EditPhoneViewController: UIViewController {
    
    var editPhone : EditPhoneView {return self.view as! EditPhoneView}
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        self.view = EditPhoneView(frame: self.view.bounds)
    }


}
