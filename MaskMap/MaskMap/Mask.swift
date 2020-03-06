//
//  mask.swift
//  maskMap
//
//  Created by wyn on 2020/3/6.
//  Copyright © 2020 Wyn. All rights reserved.
//

import Foundation

struct MaskResponse:Decodable {
    let response:Masks
}

struct Masks:Decodable {
    let masks:[MaskDetail]
}

struct MaskDetail:Decodable{
    let id:String
    let name:String
    let address:String
    let tel:String
    let adultCount: Int
    let childCount: Int
    enum CodingKeys: String, CodingKey  {
        case id = "醫事機構代碼"
        case name = "醫事機構名稱"
        case address = "醫事機構地址"
        case tel = "醫事機構電話"
        case adultCount = "成人口罩剩餘數"
        case childCount = "兒童口罩剩餘數"
    }
}

struct Time:Decodable {
    let time: Date
    enum CodingKeys: String, CodingKey  {
        case time = "來源資料時間"
    }
}
