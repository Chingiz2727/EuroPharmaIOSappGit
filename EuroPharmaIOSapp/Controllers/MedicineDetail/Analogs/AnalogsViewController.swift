//
//  AnalogsViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/9/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class AnalogsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var navigator : MainPageTableNavigator?
    var id : Int?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return analogs_view?.analogs.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let analog_id = analogs_view?.analogs[indexPath.row].id else {return}
        navigator?.detail(module: analog_id,title: analogs_view?.analogs[indexPath.row].name ?? "")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPageIdentifiers().categoryid, for: indexPath) as? AnalogCollectionViewCell
        guard let Colcell = cell else {return UICollectionViewCell()}
        Colcell.viewModule = analogs_view?.analogs[indexPath.row]
        return Colcell
    }
    
    var analogs_view : AnalogsCollectionVIew?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
    }
    
    override func loadView() {
        super.loadView()
        self.view = AnalogsCollectionVIew(frame: self.view.bounds)
        self.view = AnalogsCollectionVIew(frame: self.view.bounds)
        analogs_view =   (self.view as! AnalogsCollectionVIew)
        analogs_view?.collectionView.delegate = self
        analogs_view?.collectionView.dataSource = self
    }
    
    func updateData(){
        guard let id = id else {return}
        
        networkManager.getProductDetail(id: id) { (prod, error) in
            guard let analogs = prod?.analogs else {return}
            self.analogs_view?.analogs = analogs
            DispatchQueue.main.async {
                self.analogs_view?.collectionView.reloadData()
            }
        }
    }
    var networkManager: NetworkManager!
    init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.networkManager = networkManager
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
