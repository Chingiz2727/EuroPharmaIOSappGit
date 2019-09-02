//
//  RegistrationCodeViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/28/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class RegistrationCodeViewController: UIViewController {
    var code : RegistrationCodeView {return self.view as! RegistrationCodeView}
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        self.view = RegistrationCodeView(frame: self.view.bounds)
    }

    

}
