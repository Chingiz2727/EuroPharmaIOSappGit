//
//  PersonalSettingViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class PersonalSettingViewController: UIViewController {
    var settings : PersonalSettingView {return self.view as! PersonalSettingView}
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "Личная информация"

        // Do any additional setup after loading the view.
    }
    override func loadView() {
        super.loadView()
        self.view = PersonalSettingView(frame: self.view.bounds)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
