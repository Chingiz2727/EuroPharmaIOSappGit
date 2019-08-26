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
import SKActivityIndicatorView
class MedicineDetailViewController: UIViewController {
    var product : ProductElement?
    var title_name : String?
    var analog = [Analog]()
    var id : Int?
    var navigator : MainPageTableNavigator?
    let segment = UISegmentedControl(items: ["Описание","Аналоги"])
    let network = NetworkManager()
    private lazy var Medicine : MedicineDetailTableViewController = {
       let Medicine = MedicineDetailTableViewController(networkManager: network)
        Medicine.id = self.id
        navigationItem.title = Medicine.product?.name ?? ""
        return Medicine
    }()
    
    private lazy var Analogs : AnalogsViewController = {
        let analogs = AnalogsViewController(networkManager: network)
        analogs.id = self.id
        analogs.navigator = navigator
        analogs.updateData()
        return analogs
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addsegment()
        updateView()
        navigationItem.title = title_name ?? ""
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.toolbar.barTintColor = .white
        self.view.backgroundColor = .white
    }
    
    
    func addsegment() {
        self.view.addSubview(segment)
        segment.snp.makeConstraints { (cons) in
            cons.left.right.top.equalTo(self.view).inset(10)
            cons.height.equalTo(35)
        }
        segment.tintColor = .custom_gray()
     
        
        segment.tintColor = .custom_gray()
        
        segment.addTarget(self, action: #selector(segmentChanged(segment:)), for: .valueChanged)
        segment.selectedSegmentIndex = 0
    }
    
    @objc func segmentChanged(segment:UISegmentedControl) {
        updateView()
    }
   
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        
    }
  
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    var networkManager: NetworkManager!
    init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.networkManager = networkManager
    }
    
 
    
    private func updateView() {
        if segment.selectedSegmentIndex == 0 {
            remove(asChildViewController: Analogs)
            add(asChildViewController: Medicine)
        } else {
            remove(asChildViewController: Medicine)
            add(asChildViewController: Analogs)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.snp.makeConstraints { (cons) in
            cons.left.right.bottom.equalTo(self.view).inset(0)
            cons.top.equalTo(segment.snp.bottom).offset(10)
        }
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParent()
    }
    
    

}
