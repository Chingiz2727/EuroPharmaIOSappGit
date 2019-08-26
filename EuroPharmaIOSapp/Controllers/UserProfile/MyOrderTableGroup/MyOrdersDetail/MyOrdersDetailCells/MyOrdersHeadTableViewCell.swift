//
//  MyOrdersHeadTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/19/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class MyOrdersHeadTableViewCell: UITableViewCell {
    let id = UILabel()
    let status = UILabel()
    lazy var stack = UIStackView()
    
    
    
    func addview () {
    addSubview(stack)
        id.get_bold(size: 18)
        status.get_regular(size: 16)
        id.text = "№ 1253460210"
        status.text = "Доставлен 16 августа 2019"
        id.textColor = .custom_gray()
        status.textColor = .custom_green()
        stack.customStack(view: [id,status], distribution: .fill, spacing: 7)
        stack.axis = .vertical
        stack.snp.makeConstraints { (cons) in
            cons.edges.equalToSuperview().inset(10)
        }
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//         Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

//         Configure the view for the selected state
    }

}
class MyOrdItem {
    var name : String?
    var title : String?
    
    init(name:String,title:String) {
        self.name = name
        self.title = title
    }
}
