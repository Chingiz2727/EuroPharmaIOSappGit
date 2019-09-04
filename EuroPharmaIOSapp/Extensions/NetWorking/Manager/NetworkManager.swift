//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by Malcolm Kumwenda on 2018/03/11.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import Foundation
import RealmSwift
enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}
enum NetworkEnvironment {
    case qa
    case production
    case staging
}

struct NetworkManager {
    let router = Router<ShopApi>()
    
    func getShopList(completion:@escaping(_ product:Product?,_ error:String?)->()) {
        router.request(.mainpage) { (data, response, error) in
            if error != nil {
                completion(nil,"Пожалуйста проверьте соединение с интернетом")
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case.success:
                    guard let responseData = data else {
                        completion(nil,NetworkResponse.noData.rawValue)
                        return
                        
                    }
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode(Product.self, from: responseData)
                        completion(apiResponse,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                    
                }
            }
        }
    }
    
    func getProductDetail(id:Int,completion:@escaping(_ product:ProductElement?,_ error:String?)->()) {
        
        router.request(.product(id: id)) { (data, response, error) in
            
            if error != nil {
                completion(nil,"Пожалуйста проверьте соединение с интернетом")
            }
            
            if let response = response as? HTTPURLResponse {
                
                let result = self.handleNetworkResponse(response)
                
                switch result {
                case.success:
                    guard let responseData = data else {
                        completion(nil,NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode(ProductElement.self, from: responseData)
                        completion(apiResponse,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                    
                }
            }
        }
    }
    
    
    func getCatalog(id:Int,completion:@escaping(_ product:[ProductElement]?,_ error:String?)->()) {
        
        router.request(.catalog(id: id)) { (data, response, error) in
            if error != nil {
                completion(nil,"Пожалуйста проверьте соединение с интернетом")
            }
            
            if let response = response as? HTTPURLResponse {
                
                let result = self.handleNetworkResponse(response)
                
                switch result {
                case.success:
                    guard let responseData = data else {
                        completion(nil,NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .useDefaultKeys
                        decoder.dataDecodingStrategy = .deferredToData
                        
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .allowFragments)
                        let apiResponse = try decoder.decode([ProductElement].self, from: responseData)
                        print(jsonData)
                        completion(apiResponse,nil)
                    }catch let err {
                        print(err.localizedDescription)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                    
                }
            }
        }
    }
    
    func MakeLogin(phone:String,password:String,completion:@escaping(_ error:String?)->()) {
        
        router.request(.auth(phone: phone, password: password)) { (data, response, error) in
            if error != nil {
                completion("Пожалуйста проверьте соединение с интернетом")
            }
            
            
            if let response = response as? HTTPURLResponse {
                
                let result = self.handleNetworkResponse(response)
                
                switch result {
                case.success:
                    guard let responseData = data else {
                        completion(NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode(AuthorizationModule.self, from: responseData)
                        self.getUserInfo(token: apiResponse.token!, completion: { (error) in
                            guard let error = error  else { return
                                completion(nil)
                            }
                            completion(error)

                        })
                    }catch {
                        print(error)
                        completion(NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(networkFailureError)
                    
                }
            }
        }
    }
    
    
    func getUserInfo(token:String,completion:@escaping(_ error:String?)->()) {
        router.request(.userInfo(token: token)) { (data, response, error) in
            if error != nil {
                completion("Пожалуйста проверьте соединение с интернетом")
            }
            
            if let response = response as? HTTPURLResponse {
                
                let result = self.handleNetworkResponse(response)
                
                switch result {
                case.success:
                    guard let responseData = data else {
                        completion(NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode(UserModule.self, from: responseData)
                        
                        let realm = try? Realm()
                        let data = UserData()
                        data.token = token
                        data.city_id = apiResponse.city_id ?? 0
                        data.first_name = apiResponse.first_name
                        data.last_name = apiResponse.last_name
                        data.phone = apiResponse.phone
                        data.logo = apiResponse.logo
                        data.id = apiResponse.id ?? 0
                        try? realm?.write {
                            realm?.add(data)
                            completion(nil)
                        }
                    }catch {
                        print(error)
                        completion( NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion( networkFailureError)
                    
                }
            }
        }
    }
    
    func getCityList(completion:@escaping(_ cityList:CityModule?,_ error:String?)->()) {
        router.request(.getCityList) { (data, response, error) in
            if error != nil {
                completion(nil,"Пожалуйста проверьте соединение с интернетом")
            }
            
            if let response = response as? HTTPURLResponse {
                
                let result = self.handleNetworkResponse(response)
                
                switch result {
                case.success:
                    guard let responseData = data else {
                        completion(nil,NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode(CityModule.self, from: responseData)
                            completion(apiResponse,nil)
                        
                        
                    } catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                    
                }
            }
        }
    }
    
    func categoryDetail(id:Int,completion:@escaping(_ cat:Product?,_ error:String?)->()) {
        router.request(.categories(id: id)) { (data, response, error) in
            if error != nil {
                completion(nil,"Пожалуйста проверьте соединение с интернетом")
            }
            
            if let response = response as? HTTPURLResponse {
                
                let result = self.handleNetworkResponse(response)
                
                switch result {
                case.success:
                    guard let responseData = data else {
                        completion(nil,NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        
                        let apiResponse = try JSONDecoder().decode(Product.self, from: responseData)
                        DispatchQueue.main.async {
                            completion(apiResponse,nil)

                        }
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                    
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
