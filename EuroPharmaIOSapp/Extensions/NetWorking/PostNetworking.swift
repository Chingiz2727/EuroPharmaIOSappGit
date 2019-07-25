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


class PostNetworking {
    class func Post(params:HTTPHeaders,url:String,completion:@escaping(Data)->Void){
        let header : HTTPHeaders = params
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            DispatchQueue.main.async {
                if let data = response.data {
                    completion(data)
                }
            }
            
        }
        
    }
}


class Networking {
    
    class func Request<T:Decodable>(type:T.Type,params:[String:Any]?,header:HTTPHeaders?,url:String,method:HTTPMethod,completion:@escaping(_ data:T?,_ isSucces:Bool, _ error_desc:Error?)->()) {

        
        Alamofire.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON(completionHandler: { (response) in
            response.result.ifSuccess {
                if let info = response.data {
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
                        }
                    }
                }
                
            }
            response.result.ifFailure {
                completion(nil,false,response.result.error)
            }
        })
    }
}
