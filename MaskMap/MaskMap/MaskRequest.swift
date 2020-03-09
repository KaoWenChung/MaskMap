//
//  MaskRequest.swift
//  maskMap
//
//  Created by wyn on 2020/3/6.
//  Copyright © 2020 Wyn. All rights reserved.
//

import Foundation

enum maskError:Error {
    case noDataAvailable
    case canNotProcessData
}

struct MaskRequest {
    let resourceURL:URL
    
    init(address:String){
//        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy/MM/dd HH:mm:ss"
//        let currentDate = format.string(from: date)
        let resourceString = "https://quality.data.gov.tw/dq_download_json.php?nid=116285&md5_url=2150b333756e64325bdbc4a5fd45fad1"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    func getMasks (completion: @escaping(Result<[MaskDetail], maskError>)->Void){
        let dataTask = URLSession.shared.dataTask(with: resourceURL){data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let maskResponse = try decoder.decode(MaskResponse.self, from: jsonData)
                let maskDetails = maskResponse.response.masks
                completion(.success(maskDetails))
            }catch{
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}
