//
//  PostNetworking.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/16/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit




class Networking {
    
    class func Request<T:Decodable>(view:UIViewController,type:T.Type,params:[String:Any]?,header:HTTPHeaders?,url:String,method:HTTPMethod,completion:@escaping(_ data:T?,_ isSucces:Bool, _ error_desc:Error?)->()) {

        let activityIndicator = UIActivityIndicatorView()
        view.view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints({ (cons) in
            cons.center.equalTo(view.view)
            cons.width.height.equalTo(100)
        })
        activityIndicator.style = .whiteLarge
        activityIndicator.color = .custom_green()

        activityIndicator.backgroundColor = .custom_gray()
        activityIndicator.startAnimating()
        activityIndicator.layer.cornerRadius = 15
        Alamofire.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON(completionHandler: { (response) in
            response.result.ifSuccess {
               
                
                if let info = response.data {
                    activityIndicator.stopAnimating()

                    DispatchQueue.global().async {
                        do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .useDefaultKeys
                            
                            let downloadData = try decoder.decode(type, from: info)
                            DispatchQueue.main.async {
                                completion(downloadData,true,nil)
                             
                            }
                            
                        }
                        catch let error {
                            completion(nil,false,error)
                            CustomAlert.customAlert.showalert(controller: view, text: "Ошибка", message: "Попробуйте позже")
                        }
                    }
                }
                else {

                    completion(nil,false,nil)
                }
                
            }
            
            response.result.ifFailure {
                activityIndicator.stopAnimating()
                completion(nil,false,response.result.error)
                CustomAlert.customAlert.showalert(controller: view, text: "Ошибка", message: "Подключитесь к интернету")
            }
        })
    }
}
