
import UIKit
import RealmSwift
class BuyProductsButton: UIView {
    var write : WriteProduct?
    
    @objc func add_product() {
        count += 1
        action?.count = count
        write?.appenData()
    }
    
   @objc func decrease_product() {
    action?.count = count
    
    if count != 0 {
        count -= 1
    }
    write?.write_count(count: count)
    if count == 0 {
        write?.remove()
        action?.remove()
        count = 1

    }
}
    
    var action : BuyProductActions?
    var count: Int = 1 {
        didSet {
            count_label.text = String(count)
        }
    }
    
   
    let buy_view = UIView()
    var minus_button = UIButton()
    var plus_button = UIButton()
    var count_label = UILabel()
    lazy var buy_stack = UIStackView()
    
    func addview() {
        addSubview(buy_view)
        buy_view.addSubview(buy_stack)
        buy_view.layer.cornerRadius = 3
        buy_view.layer.borderWidth = 1
        buy_view.layer.borderColor = UIColor.custom_green().cgColor
        buy_view.snp.makeConstraints { (cons) in
            cons.top.right.bottom.left.equalTo(buy_stack).inset(0)
        }
        plus_button.addTarget(self, action: #selector(add_product), for: .touchUpInside)
        minus_button.addTarget(self, action: #selector(decrease_product), for: .touchUpInside)
        buy_stack.customStack(view: [minus_button,count_label,plus_button], distribution: .fillProportionally, spacing: 0)
        buy_stack.axis = .horizontal
        minus_button.setTitle("-", for: .normal)
        minus_button.setTitleColor(.custom_green(), for: .normal)
        plus_button.setTitleColor(.custom_green(), for: .normal)
        plus_button.setTitle("+", for: .normal)
        count_label.text = "1"
        count_label.textColor = .custom_green()
        buy_stack.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(self)
        }
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addview()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
