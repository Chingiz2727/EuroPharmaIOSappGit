//
//  CategoryContentModel.swift
//  tableview_with_colletionview
//
//  Created by Robert Hills on 04/03/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
import IGListKit
class CategoryContentModel:ListDiffable,Equatable {
    static func == (lhs: CategoryContentModel, rhs: CategoryContentModel) -> Bool {
        return lhs.isEqual(toDiffableObject: rhs)
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return self as! NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? CategoryContentModel else { return false }
        return category_content == object.category_content
    }
    
    var title: String? = nil
    var type: String? = nil
    var old_price : Int? = nil
    var new_price : Int? = nil
    var menufacturer : String? = nil
    var category : String? = nil
    var category_content = [CategoryContentModel]()
    var content_media = [Int?]()
    var img_url : String? = nil
    var id : Int? = nil

  
}
