//
//  WritePhoneViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 9/2/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class WritePhoneViewController: UIViewController {
    var write_phone : WritePhoneView {return self.view as! WritePhoneView}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        write_phone.send_button.addTarget(self, action: #selector(go), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    @objc func go() {
        self.navigationController?.pushViewController(WriteCodetoPhoneViewController(), animated: true)
    }
    
    override func loadView() {
        super.loadView()
        self.view = WritePhoneView(frame: self.view.bounds)
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
