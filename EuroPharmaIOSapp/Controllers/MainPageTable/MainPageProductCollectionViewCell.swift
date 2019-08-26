//
//  ItemCell.swift
//  tableview_with_colletionview
//
//  Created by Robert Hills on 04/03/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
import SDWebImage
import RealmSwift

class ItemCell: UICollectionViewCell {
    fileprivate var isCategory: Bool = true
    fileprivate var imageHeightRatio: CGFloat = 1
    fileprivate var cellType: String = "football"
    
  
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let contentViewConstraints = [
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        NSLayoutConstraint.activate(contentViewConstraints)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
   
    
   
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.numberOfLines = 2
//        label.font = UIFont(name: "SegoeUI", size: 20)
        label.get_regular(size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let price : UILabel = {
        let labele = UILabel()
        labele.textColor = .custom_gray()
        labele.numberOfLines = 0
        labele.textAlignment = .left
//        labele.font = UIFont(name: "SegoeUI", size: 22)
        labele.get_regular(size: 22)
        labele.sizeToFit()

        labele.translatesAutoresizingMaskIntoConstraints = false
        return labele
    }()
    
    let discount : UILabel = {
        let labele = UILabel()
        labele.textColor = .black
        labele.backgroundColor = .orange
        labele.numberOfLines = 0
        labele.textAlignment = .left
//        labele.font = UIFont(name: "SegoeUI", size: 13)
        labele.get_regular(size: 13)
        labele.sizeToFit()
        labele.translatesAutoresizingMaskIntoConstraints = false
        return labele
    }()
    
 
    
    let country : UILabel = {
        let labele = UILabel()
        labele.textColor = .black
        labele.numberOfLines = 0
        labele.textAlignment = .left
//        labele.font = UIFont(name: "SegoeUI", size: 13)
        labele.get_regular(size: 13)
        labele.frame = CGRect(x: 20, y: 20, width: 200, height: 800)

        labele.sizeToFit()

        labele.translatesAutoresizingMaskIntoConstraints = false
        return labele
    }()
    
    let old_price : UILabel = {
        let labele = UILabel()
        labele.textColor = #colorLiteral(red: 0.7411764706, green: 0.7529411765, blue: 0.7607843137, alpha: 1)
//        labele.font = UIFont(name: "SegoeUI", size: 18)
        labele.get_regular(size: 13)
        labele.textColor = .gray
        labele.numberOfLines = 0
        labele.sizeToFit()
        labele.textAlignment = .right
        labele.translatesAutoresizingMaskIntoConstraints = false
        return labele
    }()
    
    lazy var stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel])
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    let mediaPoster: ImageLoader = {
        let imageView = ImageLoader()
        imageView.image = UIImage()
        imageView.translatesAutoresizingMaskIntoConstraints = false //call this so image is added to view
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()
    
    lazy var stack_cos : UIStackView = UIStackView()
    
 
  var favourite = FavouriteView()
    

    func setupViews() {
        self.backgroundColor = .white
        
    
        clipsToBounds = true
    
        self.addSubview(mediaPoster)
        mediaPoster.snp.makeConstraints { (cons) in
            cons.top.equalTo(self).inset(26)
            cons.left.right.equalTo(self).inset(20)
            cons.height.equalTo(84)
            cons.width.equalTo(120)
        }
        self.addSubview(favourite)
        favourite.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(30)
            cons.top.equalTo(self).inset(11)
            cons.right.top.equalTo(self).inset(11)
        }
      
        self.addSubview(stack_cos)
    
        stack_cos.customStack(view: [price], distribution: .fill, spacing: 6)
        stack_cos.axis = .horizontal
     
       
      
        self.addSubview(stack)
       
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(15)
            cons.right.equalTo(self).inset(40)
            cons.top.equalTo(mediaPoster.snp.bottom).offset(17)
        }
        titleLabel.get_regular(size: 15)
        titleLabel.textColor = .custom_gray()
        stack_cos.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(15)
            cons.right.equalTo(self).inset(15)
            cons.top.equalTo(titleLabel.snp.bottom).offset(7)
            cons.bottom.equalTo(self).inset(15)
        }
        stack_cos.layoutIfNeeded()
        stack_cos.sizeToFit()
        discount.get_regular(size: 13)
        discount.textColor = .custom_gray()
        price.get_bold(size: 15)
        price.textColor = .custom_gray()
       
    }
    override func prepareForReuse() { //This prevents images/text etc being reused on another cell (wrong image/text displayed)
        super.prepareForReuse()
  
    }
    

    var id : Int = 0 {
        didSet {
            favourite.check(id: id)
        }
    }
    
   var viewModule : ProductViewCellModuleType? {
        willSet(viewModule) {
            guard  let viewModule = viewModule else {
                return
            }
            favourite.viewModule = FavModule(id: viewModule.id, img: viewModule.img_url, cost: viewModule.new_price, name: viewModule.title,manufacturer: viewModule.menufacturer)
            self.id = viewModule.id
            titleLabel.text = viewModule.title
            price.text = String(viewModule.new_price) + tg_sign
            if viewModule.new_price == viewModule.old_price {
               
                }
            else {
                stack_cos.addArrangedSubview(old_price)
                old_price.attributedText = (String(viewModule.old_price) + tg_sign).strikeThrough()
            }
            
            mediaPoster.loadImageWithUrl(URL(string: viewModule.img_url)!)
            
        }
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.layer.cornerRadius = 4
    
    }

}

extension UIView {
    func addSubViews(withList views: [UIView]) -> Void {
        for view in views {
            self.addSubview(view)
        }
    }
    
    //Remove Constraints
    func removeConstraints() {
        removeConstraints(constraints)
    }
    
    func deactivateAllConstraints() {
        NSLayoutConstraint.deactivate(getAllConstraints())
    }
    
    func getAllSubviews() -> [UIView] {
        return UIView.getAllSubviews(view: self)
    }
    
    func getAllConstraints() -> [NSLayoutConstraint] {
        
        var subviewsConstaints = getAllSubviews().flatMap { (view) -> [NSLayoutConstraint] in
            return view.constraints
        }
        
        if let superview = self.superview {
            
            subviewsConstaints += superview.constraints.compactMap { (constraint) -> NSLayoutConstraint? in
                if let view = constraint.firstItem as? UIView {
                    if view == self {
                        return constraint
                    }
                }
                return nil
            }
        }
        
        return subviewsConstaints + constraints
    }
    
    class func getAllSubviews(view: UIView) -> [UIView] {
        return view.subviews.flatMap { subView -> [UIView] in
            return [subView] + getAllSubviews(view: subView)
        }
    }
}

extension NSMutableAttributedString{
    func setColorForText(_ textToFind: String, with color: UIColor) {
        let range = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        if range.location != NSNotFound {
            addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
    }
}
