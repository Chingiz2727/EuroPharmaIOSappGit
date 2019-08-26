//
//  EditPassCodeeViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/26/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class EditPassCodeeViewController: UIViewController {
     var editpass : EditPassCodeView {return self.view as! EditPassCodeView}
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        self.view = EditPassCodeView(frame: self.view.bounds)
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
