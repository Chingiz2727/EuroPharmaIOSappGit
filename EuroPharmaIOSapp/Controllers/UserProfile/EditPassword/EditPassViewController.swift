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

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        self.view = EditPassView(frame: self.view.bounds)
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
