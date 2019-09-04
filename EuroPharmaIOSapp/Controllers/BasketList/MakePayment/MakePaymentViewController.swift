//
//  MakePaymentViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 9/3/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class MakePaymentViewController: UIViewController {
    var payView : MakePaymentView {return self.view as! MakePaymentView}
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    override func loadView() {
        super.loadView()
        self.view = MakePaymentView(frame: self.view.bounds)
    }

}
