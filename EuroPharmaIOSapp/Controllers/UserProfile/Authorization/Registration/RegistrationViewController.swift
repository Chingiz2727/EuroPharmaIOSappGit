//
//  RegistrationViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    var register : RegistrationView  {return self.view as! RegistrationView}
    override func viewDidLoad() {
        super.viewDidLoad()
        register.register.addTarget(self, action: #selector(go_code), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        super.loadView()
        self.navigationController?.navigationBar.isHidden = true
        self.view = RegistrationView(frame: self.view.bounds)
    }
    
    @objc func go_code() {
        self.navigationController?.pushViewController(RegistrationCodeViewController(), animated: true)
    }


}
