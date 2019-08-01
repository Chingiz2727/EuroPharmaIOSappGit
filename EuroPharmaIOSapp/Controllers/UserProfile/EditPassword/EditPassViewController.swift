//
//  EditPassViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/19/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class EditPassViewController: UIViewController {
    var edit_pass : EditPassView {return self.view as! EditPassView}
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        super.loadView()
        self.view = EditPassView(frame: self.view.bounds)
    }



}
