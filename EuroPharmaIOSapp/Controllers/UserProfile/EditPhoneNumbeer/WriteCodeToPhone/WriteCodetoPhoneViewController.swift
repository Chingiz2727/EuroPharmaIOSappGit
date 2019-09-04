//
//  WriteCodetoPhoneViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 9/2/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class WriteCodetoPhoneViewController: UIViewController {
    var write_code : WriteCodeToPhoneView  {return self.view as! WriteCodeToPhoneView}
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    override func loadView() {
        super.loadView()
        self.view = WriteCodeToPhoneView(frame: self.view.bounds)
    }


}
