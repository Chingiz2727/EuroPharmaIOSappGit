//
//  ItemCell.swift
//  tableview_with_colletionview
//
//  Created by Robert Hills on 04/03/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
import SwiftyStarRatingView
import SDWebImage
import RealmSwift
class ItemCell: UICollectionViewCell {
    fileprivate var isCategory: Bool = true
    fileprivate var imageHeightRatio: CGFloat = 1
    fileprivate var cellType: String = "football"
    
    var item : CategoryContentModel? {
        didSet {
            old_price.attributedText = (String(item?.old_price ?? 0) + " тг").strikeThrough()
            price.text = String(item?.new_price ?? 0) + " тг"
            titleLabel.text = String(item?.title ?? "")
            
        }
    }
    
    
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
    
    override func prepareForReuse() { //This prevents images/text etc being reused on another cell (wrong image/text displayed)
        super.prepareForReuse()
        
      
   
    }
    let star_rating : SwiftyStarRatingView = {
       let star = SwiftyStarRatingView()
        star.maximumValue = 5
        star.minimumValue = 0
        star.isUserInteractionEnabled = false
        star.tintColor = .orange
        star.allowsHalfStars = true
        star.value = 4
        return star
    }()
    
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.numberOfLines = 2
        label.font = UIFont(name: "Arial", size: 15)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let price : UILabel = {
        let labele = UILabel()
        labele.textColor = .black
        labele.numberOfLines = 0
        labele.frame = CGRect(x: 20, y: 20, width: 200, height: 800)

        labele.textAlignment = .left
        labele.font = UIFont(name: "Arial", size: 16)
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
        labele.font = UIFont(name: "Arial", size: 13)
        labele.sizeToFit()
        labele.translatesAutoresizingMaskIntoConstraints = false
        return labele
    }()
    
    let like_button : UIButton = {
        let button = UIButton()
      
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    let country : UILabel = {
        let labele = UILabel()
        labele.textColor = .black
        labele.numberOfLines = 0
        labele.textAlignment = .left
        labele.font = UIFont(name: "Arial", size: 13)
        labele.frame = CGRect(x: 20, y: 20, width: 200, height: 800)

        labele.sizeToFit()

        labele.translatesAutoresizingMaskIntoConstraints = false
        return labele
    }()
    let old_price : UILabel = {
        let labele = UILabel()
        labele.textColor = .red
        labele.font = UIFont(name: "Arial", size: 16)
        labele.numberOfLines = 0
        labele.frame = CGRect(x: 20, y: 20, width: 200, height: 800)

        labele.sizeToFit()
        labele.textAlignment = .left
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
    
    @objc func like() {
        if (like_button.imageView?.image == UIImage(named: "like")) {

            like_button.setImage(UIImage(named: "unlike"), for: .normal)
            remove_fav()
        } else{
            
            like_button.setImage(UIImage(named: "like"), for: .normal)
            add_toFav()
        }
        
    }
    
    @objc func remove_fav() {
       let realm = try? Realm()
        let results = try! Realm().objects(FavouritesModule.self)
        for i in results {
            if i.id == item?.id {
                try? realm?.write {
                    realm?.delete(i)
                }
            }
        }
        
    }
    
    func add_toFav() {
        let realm = try? Realm()
        let fav = FavouritesModule()
        var fav_list = [FavouritesModule]()
        fav.id = item?.id ?? 0
        fav.cost = item?.new_price ?? 0
        fav.img_url = item?.img_url ?? ""
        fav.name = item?.title
       fav_list.append(fav)
        try? realm?.write {
            realm?.add(fav_list)
        }
    }
    func setupViews() {
        self.backgroundColor = .white
        like_button.addTarget(self, action: #selector(like), for: .touchUpInside)
        
        
        clipsToBounds = true
        self.addSubview(like_button)
        like_button.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(30)
            cons.right.equalTo(self).inset(10)
            cons.top.equalTo(self).inset(10)
            
        }
        like_button.setImage(#imageLiteral(resourceName: "unlike"), for: .normal)
        self.addSubview(mediaPoster)
        mediaPoster.snp.makeConstraints { (cons) in
            cons.top.equalTo(like_button.snp.bottom).offset(5)
            cons.left.right.equalTo(self).inset(20)
            cons.height.equalTo(100)
        }
        
        self.addSubview(stack_cos)
    
        stack_cos.customStack(view: [old_price,price], distribution: .fill, spacing: 6)
        stack_cos.axis = .horizontal
     
       
        self.addSubview(star_rating)
        star_rating.snp.makeConstraints { (cons) in
            cons.top.equalTo(mediaPoster.snp.bottom).offset(7)
            cons.left.right.equalTo(self).inset(30)
            cons.height.equalTo(20)
        }
        self.addSubview(stack)
       
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(3)
            cons.top.equalTo(star_rating.snp.bottom).offset(3)
            cons.bottom.equalTo(stack_cos.snp.top).offset(3)
        }
        stack_cos.snp.makeConstraints { (cons) in
            cons.left.equalTo(3)
            
            cons.bottom.equalTo(self).inset(5)
        }
        
       
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
