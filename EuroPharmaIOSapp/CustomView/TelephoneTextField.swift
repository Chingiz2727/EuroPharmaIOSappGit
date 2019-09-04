//
//  TelephoneTextField.swift
//  EuroPharmaIOSapp
//
//  Created by Александр on 9/3/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import TextFieldEffects
import SwiftPhoneNumberFormatter

class TelephoneTextField: HoshiTextField {
    
    override func textFieldDidBeginEditing() {
        super.textFieldDidBeginEditing()
        guard self.text!.count == 0 else { return }
        self.text = "+7 "
    }
    
    func checkTelephoneNumber(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        let components = newString.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
        let decimalString = components.joined(separator: "") as NSString
        let length = decimalString.length
        
        if length == 1 || length > 11 {
            let newLength = (textField.text! as NSString).length + (string as NSString).length - range.length as Int
            return !(newLength > 10 || newLength < 3)
        }
        
        let formattedString = NSMutableString()
        formattedString.append("+7 ")
        var index = 1
        
        if length - index > 3 {
            let areaCode = decimalString.substring(with: NSMakeRange(index, 3))
            formattedString.appendFormat("(%@) ", areaCode)
            index += 3
        }
        
        if length - index > 3 {
            let areaCode = decimalString.substring(with: NSMakeRange(index, 3))
            formattedString.appendFormat("%@-", areaCode)
            index += 3
        }
        
        let remainder = decimalString.substring(from: index)
        formattedString.append(remainder)
        textField.text = formattedString as String
        return false
        
    }
    
}
