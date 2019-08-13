//
//  DepartmentAdressTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/13/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class DepartmentAdressTableViewCell: UITableViewCell {

    let name = UILabel()
    let adress = UILabel()
    let time = UILabel()
    let phone = UILabel()
    let phone_img = UIImageView()
    let show_map = UIButton()
    lazy var name_stack = UIStackView()
    lazy var data_stack = UIStackView()
    func make_style() {
        name.get_regular(size: 18)
        name.numberOfLines = 0
        name.text = "Аптека №205, (АДК) ТРЦ"
        name.textColor = .custom_gray()
        adress.get_regular(size: 14)
        adress.numberOfLines = 0
        adress.textColor = .gray
        adress.text = "ТРЦ АДК ул. Сатпаева 90"
        time.get_regular(size: 14)
        time.textColor = .gray
        phone.textColor = .gray
        time.text = "Время работы: 09:00-22:00 "
        
        phone.get_regular(size: 14)
        show_map.setImage(#imageLiteral(resourceName: "pin_lalbee"), for: .normal)
        show_map.imageView?.contentMode = .scaleAspectFit
        phone_img.image = #imageLiteral(resourceName: "phone")
        phone_img.contentMode = .scaleAspectFit
        name_stack.customStack(view: [name,adress], distribution: .fill, spacing: 5)
        name_stack.axis = .vertical
        name_stack.sizeToFit()
        name_stack.layoutIfNeeded()
        data_stack.customStack(view: [time,phone], distribution: .fill, spacing: 5)
        data_stack.axis = .vertical
        data_stack.sizeToFit()
        data_stack.layoutIfNeeded()
        self.selectionStyle = .none
        let attachment = NSTextAttachment()
        attachment.image = phone_img.image
        attachment.bounds = CGRect(x: 10, y: 0, width: 15, height: 15)
        let att_string = NSAttributedString(attachment: attachment)
        
        let my_string = NSMutableAttributedString(string: "Телефон: +7(708)971-50-09")
        my_string.append(att_string)
        phone.attributedText = my_string
    }
    
    func addview() {
        self.addSubview(show_map)
        show_map.snp.makeConstraints { (cons) in
            cons.centerY.equalTo(self)
            cons.right.equalTo(self).inset(17)
            cons.width.equalTo(65)
            cons.height.equalTo(65)
        }
        
        self.addSubview(name_stack)
        name_stack.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(10)
            cons.right.equalTo(show_map.snp.left).offset(10)
            cons.top.equalTo(self).inset(10)
        }
        self.addSubview(data_stack)
        data_stack.snp.makeConstraints { (cons) in
            cons.left.bottom.lessThanOrEqualTo(self).inset(10)
            cons.top.equalTo(name_stack.snp.bottom).offset(10)
            cons.right.equalTo(show_map.snp.left).offset(10)
            cons.width.equalTo(100)
        }
       
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        make_style()
        addview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}


public extension UIButton
{
    
    func alignTextBelow(spacing: CGFloat = 6.0)
    {
        if let image = self.imageView?.image
        {
            let imageSize: CGSize = image.size
            self.titleEdgeInsets = UIEdgeInsets(top: spacing, left: -imageSize.width, bottom: -(imageSize.height), right: 0.0)
            let labelString = NSString(string: self.titleLabel!.text!)
            let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: self.titleLabel!.font])
            self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
        }
    }
}
