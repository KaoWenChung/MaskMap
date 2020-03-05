//
//  MaskTableViewController.swift
//  MaskMap
//
//  Created by wyn on 2020/3/5.
//  Copyright © 2020 Wyn. All rights reserved.
//

import UIKit

let dateFormatter: DateFormatter = {
     let formatter = DateFormatter()
     formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
     return formatter
}()
class MaskTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "maskTableViewCell", for: indexPath) as? maskTableViewCell else{ return UITableViewCell() }
            
            let mask = masks[indexPath.row]
            let timeText = dateFormatter.string(from: mask.time)
            cell.updateLabel.text = timeText
            return cell
    }


}
