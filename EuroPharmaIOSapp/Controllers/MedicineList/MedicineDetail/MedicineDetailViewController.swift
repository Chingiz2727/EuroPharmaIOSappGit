//
//  MedicineDetailViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/17/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
class MedicineDetailViewController: UIViewController {
    var detail : MedicineDetailView  {return self.view as! MedicineDetailView}
    let scroll : UIScrollView = UIScrollView()
    var product : ProductElement?
    var Basket_list = [BasketModule]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        detail.buy.addTarget(self, action: #selector(append_data), for: .touchUpInside)
      
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.popViewController(animated: true)
    }
    override func loadView() {
        super.loadView()
        self.view = MedicineDetailView(frame: self.view.bounds)
    }
    @objc func append_data() {
        
        let realm = try? Realm()
            let Basket = BasketModule()
            Basket.id = product?.id ?? 0
            Basket.count = detail.count_text
            Basket.cost = product?.price ?? 0
            Basket.name = product?.name ?? ""
            Basket.img_url = product?.img ?? ""
            Basket_list.append(Basket)
        try? realm?.write {
            realm?.add(Basket_list)
            }
    }
    
    func detail(id:String) {
        DispatchQueue.main.async {
            Networking.Request(view:self,type: ProductElement.self, params: nil, header: ["CityId":"1"], url: Endpoint.main_url.rawValue + Endpoint.products.rawValue + "/\(id)", method: .get) { (item, tru, error) in
                self.detail.product = item
                self.product = item
                self.detail.addstyle()
                if let url = item?.img {
                    Alamofire.request(url).responseJSON(completionHandler: { (response) in
                        if let data = response.data {
                            self.detail.img.image = UIImage.init(data: data)
                        }
                    })
                }
                
            }
        }
        
        
        
        
    }
    

}
