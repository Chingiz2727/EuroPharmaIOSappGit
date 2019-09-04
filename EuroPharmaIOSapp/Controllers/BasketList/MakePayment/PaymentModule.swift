//
//  PaymentModule.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 9/3/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
class PaymentModule {
    var title : String?
    var sub_title : String?
    var descript : String?
    init(title:String,subtitle:String?,descript:String?) {
        self.title = title
        self.sub_title = subtitle
        self.descript = descript
    }
}


struct PayContent {
    let main_module = [[PaymentModule(title: "Доставка курьером", subtitle: "Доставка осуществляется в течение 3 часов", descript: "Стоимость доставки: 950 ₸ \nБесплатная доставка свыше 7 000 ₸"),PaymentModule(title: "Самовывоз", subtitle: "Вы можете получить заказ в аптеке", descript: nil),PaymentModule(title: "Через АО Казпочта", subtitle: "Доставка осуществляется в течение 10 рабочих дней", descript: "Минимальная сумма заказа: 1 000 ₸ \nСтоимость доставки: 980 ₸")],[PaymentModule(title: "Оплата наличными при доставке", subtitle: nil, descript: nil),PaymentModule(title: "Онлайн оплата (через сервис kaspi.kz)", subtitle: nil, descript: nil),PaymentModule(title: "Онлайн через терминал (Kaspi Red/Visa/Mastercard/PayDA)", subtitle: nil, descript: nil),PaymentModule(title: "Онлайн оплата (через сервис PayBox)", subtitle: nil, descript: nil)]]
}
