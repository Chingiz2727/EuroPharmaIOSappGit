//
//  SearchContentView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/13/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import InstantSearch
import SwiftyJSON
class SearchContentView: UIView,UITableViewDelegate,UITableViewDataSource,updateSearchTable {
    var hits = [Hit]()
    var dismissgo : DismissAndGo?
    func update(text: String) {
        
                let client = Client(appID: "JAF0WTBM3O", apiKey: "de62593337a71b8e7ca3650cf262f558")
                let index = client.index(withName: "products")
        
                index.search(Query(query: text)) { (content, error) in
                    let json = try! JSONSerialization.data(withJSONObject: content, options: .prettyPrinted)
                    
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .useDefaultKeys
                    do {
                        let data = try decoder.decode(SearchModule.self, from: json)
                        self.hits = data.hits ?? []
                        self.table.reloadData()
                    }
                    
                    catch let error {
                        print(error)
                    }
                 
                    

        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = hits[indexPath.row]
        
        dismissgo?.DissMissAndGo(id:Int(item.objectID ?? "0")! ,title:item.name ?? "")
    }
    private let cellid = "cellid"
    let table = UITableView()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
        cell.textLabel?.textColor = .custom_gray()
        cell.backgroundColor = .white()
        cell.textLabel?.text = hits[indexPath.row].name ?? ""
        cell.selectionStyle = .none
        return cell
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.endEditing(true)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
        self.addSubview(table)
        table.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(self)
        }
        table.backgroundColor = .white()
        
        table.keyboardDismissMode = .onDrag
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

protocol updateSearchTable {
    func update(text:String)
}
