//
//  LoginViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {
    var login : LoginView {return self.view as! LoginView}
    var reload : reloadData?
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
        let phone = login.phone.text?.replacingOccurrences(of:" ", with: "").replacingOccurrences(of: "-", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: "+", with: "")
        Networking.Request(view: self, type: AuthorizationModule.self, params: ["phone":phone,"password":login.password.text ?? ""], header: nil, url: Endpoint.main_url.rawValue + Endpoint.auth.rawValue, method: .post) { (item, success, error) in
            if success == true {
                Networking.Request(view: self, type: UserModule.self, params: nil, header: ["Authorization":"Bearer \(item?.token ?? "")"], url: Endpoint.main_url.rawValue + Endpoint.userinfo.rawValue, method: .get, completion: { (user, issuccess, err) in
                    if issuccess == true {
                        
                        let realm = try? Realm()
                        let data = UserData()
                        data.token = item?.token
                        data.city_id = user?.city_id ?? 0
                        data.first_name = user?.first_name
                        data.last_name = user?.last_name
                        data.phone = user?.phone
                        data.logo = user?.logo
                        data.id = user?.id ?? 0
                        try? realm?.write {
                            realm?.add(data)
                            self.reload?.reload()
                            self.navigationController?.popViewController(animated: true)
                        }
                    }
                })
            }
            else {
                CustomAlert.customAlert.showalert(controller: self, text: "Ошибка", message: "Не правильный логин или пароль")
            }
            
            
        }
//        self.navigationController?.pushViewController(ProfileTableViewController(), animated: true)
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
