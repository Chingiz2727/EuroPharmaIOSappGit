//
//  ChooseCityViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/22/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift
class ChooseCityViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
     var cityView : ChooseCityView {return self.view as! ChooseCityView}
    var window: UIWindow?
    var coordinator: MainPageNavigator?
    var id : Int? = nil {
    didSet {
        cityView.button.isUserInteractionEnabled = true
    cityView.button.backgroundColor = .custom_green()
    }
    }
    var name : String? = nil
    var module = CityModule()
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return module.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return module[row].name ?? ""
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = module[row]
        self.id = item.id
        self.name = item.name
//        print(module[row].name)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.isTranslucent = false
        cityView.picker.delegate = self
        cityView.picker.dataSource = self
        cityView.button.addTarget(self, action: #selector(saveCity), for: .touchUpInside)
        loadData()
    }
    var network: NetworkManager!

    init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.network = networkManager
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let realm = try! Realm().objects(SavedCity.self)
    
    func loadData() {
        network.getCityList { (module, error) in
            if let module = module {
                self.module = module
                DispatchQueue.main.async {
                    self.cityView.picker.reloadAllComponents()

                }

            }
        }
    }
    
    override func loadView() {
        super.loadView()
        self.view = ChooseCityView(frame: self.view.bounds)
    }
    @objc func saveCity() {
        print("citySaved")
        guard  let id = id , let name = name else {
            return
        }
        
        var module = [SavedCity]()

        let Cl = SavedCity()
        Cl.id = id
        Cl.name = name
        
        module.append(Cl)
        let realm = try! Realm()
        try! realm.write {
            print("added")
            realm.add(module)
            push()
        }
    }
    func push() {
        let navController = UINavigationController()
        coordinator = MainPageNavigator(navigationController: navController)
        // tell the coordinator to take over control
        coordinator?.start()
        
        // create a basic UIWindow and activate it
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
class SavedCity : Object {
    @objc dynamic  var id : Int = 0
  @objc dynamic var name : String? = ""
}
