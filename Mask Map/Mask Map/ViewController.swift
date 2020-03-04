//
//  ViewController.swift
//  Mask Map
//
//  Created by wyn on 2020/3/3.
//  Copyright © 2020 Wyn. All rights reserved.
//

import UIKit

struct Mask: Decodable {
    let id: String
    let name: String
    let address: String
    let tel: String
    let adultCount: String
    let childCount: String
    let time: Date
    
    enum CodingKeys: String, CodingKey  {
        case id = "醫事機構代碼"
        case name = "醫事機構名稱"
        case address = "醫事機構地址"
        case tel = "醫事機構電話"
        case adultCount = "成人口罩剩餘數"
        case childCount = "兒童口罩剩餘數"
        case time = "來源資料時間"
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Hit the API endpoint
        if let url = URL(string: "https://quality.data.gov.tw/dq_download_json.php?nid=116285&md5_url=2150b333756e64325bdbc4a5fd45fad1") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                if let data = data, let masks = try? decoder.decode([Mask].self, from: data) {
                    print(masks)
                }
            }.resume()
        }
    }
    

}

