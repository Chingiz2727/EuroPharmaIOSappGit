//
//  PersonalSettingViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift
class PersonalSettingViewController: UIViewController {
    
    var settings : PersonalSettingView {return self.view as! PersonalSettingView}
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func loadView() {
        super.loadView()
        self.view = PersonalSettingView(frame: self.view.bounds)
        
    }
    

   

}
