import Foundation
import UIKit
class CustomAlert:NSObject {
    static let customAlert = CustomAlert()
    func showalert<T:Equatable>(controller view:UIViewController,text:T,message:T) {
        let alert = UIAlertController(title: text as? String, message: message as? String, preferredStyle: .alert)
        let defaurlaction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(defaurlaction)
        DispatchQueue.main.async {
            view.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    private override init() {
        
    }
    
}


