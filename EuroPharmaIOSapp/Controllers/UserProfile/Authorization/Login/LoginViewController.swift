//
//  LoginViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var login : LoginView {return self.view as! LoginView}
    override func viewDidLoad() {
        super.viewDidLoad()
        login.register.addTarget(self, action: #selector(register), for: .touchUpInside)
        login.forget.addTarget(self, action: #selector(Forget), for: .touchUpInside)
        login.login_button.addTarget(self, action: #selector(logn), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func register() {
        self.navigationController?.pushViewController(RegistrationViewController(), animated: true)
    }
    @objc func Forget() {
        self.navigationController?.pushViewController(ForgetPassViewController(), animated: true)
    }
    @objc func logn() {
        self.navigationController?.pushViewController(ProfileTableViewController(), animated: true)
        
    }
    override func loadView() {
        super.loadView()
        self.view = LoginView(frame: self.view.bounds)
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
